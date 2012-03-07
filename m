From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v5 5/9] tegra: i2c: Add I2C driver
Date: Wed, 07 Mar 2012 13:46:47 -0700
Message-ID: <4F57C937.7090108@wwwdotorg.org>
References: <1331096428-6317-5-git-send-email-sjg@chromium.org> <1331096428-6317-6-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1331096428-6317-6-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yen Lin <yelin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/06/2012 10:00 PM, Simon Glass wrote:
> From: Yen Lin <yelin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Add basic i2c driver for Tegra2 with 8- and 16-bit address support.
> The driver requires CONFIG_OF_CONTROL to obtain its configuration
> from the device tree.
> 
> (Simon Glass: sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org modified for upstream)
> 
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

I'm not sure whether i2c_init_board() correctly detects I2C bus ID
assignment conflicts between nodes with the "-i2c" and "-i2c-dvc"
compatible values, but I think that only affects cases where the .dts
file is already wrong, so it's probably not a big deal.

Aside from that, I did a very very brief review. So,

Acked-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
