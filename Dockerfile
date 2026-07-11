FROM node:20

# Habilitar Corepack para Yarn
RUN corepack enable && corepack prepare yarn@stable --activate

# Establecer el directorio de trabajo
WORKDIR /usr/src/app

# Copiar archivos de configuración
COPY package.json yarn.lock .yarnrc.yml ./

# Instalar dependencias con Yarn
RUN yarn install --immutable

# Copiar el resto del proyecto
COPY . .

EXPOSE 3000

CMD ["yarn", "start"]