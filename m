From: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v5 5/9] tegra: i2c: Add I2C driver
Date: Wed, 07 Mar 2012 06:32:11 +0100
Message-ID: <4F56F2DB.5040106@denx.de>
References: <1331096428-6317-5-git-send-email-sjg@chromium.org>
 <1331096428-6317-6-git-send-email-sjg@chromium.org>
Reply-To: hs-ynQEQJNshbs@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1331096428-6317-6-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yen Lin <yelin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hello Simon,

Simon Glass wrote:
> From: Yen Lin <yelin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Add basic i2c driver for Tegra2 with 8- and 16-bit address support.
> The driver requires CONFIG_OF_CONTROL to obtain its configuration
> from the device tree.
> 
> (Simon Glass: sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org modified for upstream)
> 
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

again, just for completeness (Acked your v2 patch) here again:

Acked-by: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>

bye,
Heiko
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
