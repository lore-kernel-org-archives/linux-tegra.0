From: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v3 6/9] tegra: i2c: Initialise I2C on Nvidia boards
Date: Fri, 10 Feb 2012 07:30:04 +0100
Message-ID: <4F34B96C.5040207@denx.de>
References: <1328318041-10943-1-git-send-email-sjg@chromium.org>
 <1328318041-10943-7-git-send-email-sjg@chromium.org>
Reply-To: hs-ynQEQJNshbs@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1328318041-10943-7-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello Simon,

Simon Glass wrote:
> This enables I2C on all Nvidia boards including Seaboard and
> Harmony.
> 
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
> Changes in v2:
> - Add build warning if CONFIG_SYS_I2C_INIT_BOARD is not defined
> 
> Changes in v3:
> - Use CONFIG_TEGRA_I2C instead of CONFIG_TEGRA2_I2C
> 
>  board/nvidia/common/board.c |    7 +++++++
>  1 files changed, 7 insertions(+), 0 deletions(-)

Acked-by: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>

bye,
Heiko
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
