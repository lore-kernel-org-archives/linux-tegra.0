From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 6/9] ARM: tegra: use pre-processor for all device trees
Date: Mon, 04 Mar 2013 16:44:15 +0800
Message-ID: <20130304084416.0D7653E20E9@localhost>
References: <1360791198-29462-1-git-send-email-swarren@wwwdotorg.org> <1360791198-29462-7-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1360791198-29462-7-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 13 Feb 2013 14:33:15 -0700, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> This enables a C pre-processor pass on all Tegra device trees. This
> allows future use of #defines and header files in order to define names
> for various constants, such as the IDs and flags in GPIO specifiers.
> Use of those features will increase the readability of the device tree
> files.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra114-dalmore.dts      |   21 -
>  arch/arm/boot/dts/tegra114-dalmore.dtsp     |   21 +

Two comments;
1) Use '-M' when posting patches that rename files, it makes for a much
   smaller diff.  :-)
2) Now that I see this patch, it's rather striking that .dtsp and .dtsip
   are horible extensions (so are .dts and .dtsi for that matter, but
   this just kicks it up a notch). Can we not do something better?

Can we do something else here; First, does the old style /include/
directives cause any problems existing .dts files? I know it won't work
if a /include/'ed file uses a #include statement, but the other way
around should be fine. Can we instead move the entire tree over to
building with the CPP enabled? Overall it will be less horribleness for
the end user.

g.


>  arch/arm/boot/dts/tegra114-pluto.dts        |   21 -
>  arch/arm/boot/dts/tegra114-pluto.dtsp       |   21 +
>  arch/arm/boot/dts/tegra114.dtsi             |  153 -----
>  arch/arm/boot/dts/tegra114.dtsip            |  153 +++++
>  arch/arm/boot/dts/tegra20-colibri-512.dtsi  |  491 ----------------
>  arch/arm/boot/dts/tegra20-colibri-512.dtsip |  491 ++++++++++++++++
>  arch/arm/boot/dts/tegra20-harmony.dts       |  660 ----------------------
>  arch/arm/boot/dts/tegra20-harmony.dtsp      |  660 ++++++++++++++++++++++
>  arch/arm/boot/dts/tegra20-iris-512.dts      |   89 ---
>  arch/arm/boot/dts/tegra20-iris-512.dtsp     |   89 +++
>  arch/arm/boot/dts/tegra20-medcom-wide.dts   |   58 --
>  arch/arm/boot/dts/tegra20-medcom-wide.dtsp  |   58 ++
>  arch/arm/boot/dts/tegra20-paz00.dts         |  505 -----------------
>  arch/arm/boot/dts/tegra20-paz00.dtsp        |  505 +++++++++++++++++
>  arch/arm/boot/dts/tegra20-plutux.dts        |   56 --
>  arch/arm/boot/dts/tegra20-plutux.dtsp       |   56 ++
>  arch/arm/boot/dts/tegra20-seaboard.dts      |  812 ---------------------------
>  arch/arm/boot/dts/tegra20-seaboard.dtsp     |  812 +++++++++++++++++++++++++++
>  arch/arm/boot/dts/tegra20-tamonten.dtsi     |  489 ----------------
>  arch/arm/boot/dts/tegra20-tamonten.dtsip    |  489 ++++++++++++++++
>  arch/arm/boot/dts/tegra20-tec.dts           |   56 --
>  arch/arm/boot/dts/tegra20-tec.dtsp          |   56 ++
>  arch/arm/boot/dts/tegra20-trimslice.dts     |  367 ------------
>  arch/arm/boot/dts/tegra20-trimslice.dtsp    |  367 ++++++++++++
>  arch/arm/boot/dts/tegra20-ventana.dts       |  611 --------------------
>  arch/arm/boot/dts/tegra20-ventana.dtsp      |  611 ++++++++++++++++++++
>  arch/arm/boot/dts/tegra20-whistler.dts      |  563 -------------------
>  arch/arm/boot/dts/tegra20-whistler.dtsp     |  563 +++++++++++++++++++
>  arch/arm/boot/dts/tegra20.dtsi              |  556 ------------------
>  arch/arm/boot/dts/tegra20.dtsip             |  556 ++++++++++++++++++
>  arch/arm/boot/dts/tegra30-beaver.dts        |  373 ------------
>  arch/arm/boot/dts/tegra30-beaver.dtsp       |  373 ++++++++++++
>  arch/arm/boot/dts/tegra30-cardhu-a02.dts    |   93 ---
>  arch/arm/boot/dts/tegra30-cardhu-a02.dtsp   |   93 +++
>  arch/arm/boot/dts/tegra30-cardhu-a04.dts    |  104 ----
>  arch/arm/boot/dts/tegra30-cardhu-a04.dtsp   |  104 ++++
>  arch/arm/boot/dts/tegra30-cardhu.dtsi       |  500 -----------------
>  arch/arm/boot/dts/tegra30-cardhu.dtsip      |  500 +++++++++++++++++
>  arch/arm/boot/dts/tegra30.dtsi              |  579 -------------------
>  arch/arm/boot/dts/tegra30.dtsip             |  579 +++++++++++++++++++
>  42 files changed, 7157 insertions(+), 7157 deletions(-)
