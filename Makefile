NAME = Wolf3D

SDLFLAGS = -framework SDL2 -F ./frameworks

SDL2_HEADER = -I ./frameworks/SDL2.framework/Headers/

SDL2_P = -rpath @loader_path/frameworks/

SRCS = ./srcs/main.c \
		./srcs/events.c \
		./srcs/parse.c \
		./srcs/tools.c \
		./srcs/floornceiling.c \
		./srcs/init.c \
		./srcs/walls.c \
		./srcs/threading.c \


HEADER = ./includes/wolf3d.h.h

FLAGS = -Wall -Wextra -Werror -I./libft.h -I./fdf.h

OBJ = $(SRCS:.c=.o)

$(NAME): $(OBJ)
	@make -C libft
	@gcc -o $(NAME) $(FLAGS) $(SRCS) $(SDL2_P) $(SDLFLAGS) $(SDL2_HEADER) ./libft/libft.a
	@echo “Wolf compilation done”

all: $(NAME)

clean:
		@make clean -C libft
		@rm -f $(OBJ)

fclean: clean
		@make fclean -C libft
		@rm -f $(NAME)

re: fclean all
