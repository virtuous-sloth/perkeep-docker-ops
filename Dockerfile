FROM virtuoussloth/perkeep:latest

WORKDIR /home/keepy

# Punch out persistent data to single directory
RUN mkdir -p /keep/config && ln -sf /keep/config .config
RUN mkdir -p /keep/var    && ln -sf /keep/var    var
RUN mkdir -p /keep/log    && ln -sf /keep/log    log
# These commands should work and not fail even when
# there is persisted data in /keep

# Start perkeep daemon with redirects to log files
CMD perkeepd 1> log/stdout 2> log/stderr
