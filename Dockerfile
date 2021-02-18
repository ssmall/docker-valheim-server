ARG STEAMCMD_IMAGE=cm2network/steamcmd:latest
FROM ${STEAMCMD_IMAGE}

ENV GAMEDIR /home/${USER}/Valheim

RUN mkdir ${GAMEDIR}
RUN ./steamcmd.sh +login anonymous +force_install_dir ${GAMEDIR} +app_update 896660 validate +exit
COPY start_valheim.sh ${GAMEDIR}/

ENV SERVER_NAME "My Valheim Server"
ENV PORT 2456
ENV WORLD_NAME "Dedicated"
ENV SAVE_DIR /saves

WORKDIR ${GAMEDIR}
CMD ["./start_valheim.sh"]