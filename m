From: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Subject: Re: [U-Boot] [PATCH v3 4/9] tegra: fdt: i2c: Add extra I2C bindings
 for	U-Boot
Date: Fri, 10 Feb 2012 07:29:14 +0100
Message-ID: <4F34B93A.2050503@denx.de>
References: <1328318041-10943-1-git-send-email-sjg@chromium.org>
 <1328318041-10943-5-git-send-email-sjg@chromium.org>
Reply-To: hs-ynQEQJNshbs@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1328318041-10943-5-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello Simon,

Simon Glass wrote:
> Add U-Boot's peripheral clock information to the Tegra20 device tree file.
> 
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
> Changes in v2:
> - Adjust definitions to fit new peripheral clock bindings
> - Change 'speed' to 'clock-frequency'
> - Remove u-boot,pinmux binding (sadly)
> 
> Changes in v3:
> - Move speed setting from tegra20.dtsi to board .dts file
> 
>  arch/arm/dts/tegra20.dtsi |    6 +++++-
>  1 files changed, 5 insertions(+), 1 deletions(-)

Acked-by: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>

bye,
Heiko
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
