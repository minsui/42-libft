NAME = libft.a
CC = cc
CFLAGS = -Wall -Wextra -Werror

# 소스 파일 목록
SRCS = ft_isalpha.c ft_isdigit.c ft_isalnum.c ft_isascii.c ft_isprint.c \
       ft_strlen.c ft_memset.c ft_bzero.c ft_memcpy.c ft_memmove.c \
       ft_strlcpy.c ft_strlcat.c ft_toupper.c ft_tolower.c ft_strchr.c \
       ft_strrchr.c ft_strncmp.c ft_memchr.c ft_memcmp.c ft_strnstr.c \
       ft_atoi.c ft_calloc.c ft_strdup.c ft_substr.c ft_strjoin.c \
       ft_strtrim.c ft_split.c ft_itoa.c ft_strmapi.c ft_striteri.c \
       ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c

# 연결 리스트 소스 (Part 3)
SRCS_LIST = ft_lstnew.c ft_lstadd_front.c ft_lstsize.c ft_lstlast.c \
            ft_lstadd_back.c ft_lstdelone.c ft_lstclear.c ft_lstiter.c \
            ft_lstmap.c

ALL_SRCS = $(SRCS) $(SRCS_LIST)
OBJS = $(ALL_SRCS:.c=.o)

# 기본 빌드 규칙
all: $(NAME)

# 라이브러리 생성 (ar 명령어 사용 필수) [cite: 101]
$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

# .c 파일을 .o 파일로 컴파일
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# 정리 규칙들 [cite: 27]
clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all

# 1. 보너스 전용 규칙 추가
bonus: $(OBJS)
	ar rcs $(NAME) $(OBJS)

# 2. .PHONY에 bonus 추가 (매우 중요!)
.PHONY: all clean fclean re bonus