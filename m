From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 5/9] tegra: i2c: Add I2C driver
Date: Wed, 29 Feb 2012 13:30:24 -0700
Message-ID: <4F4E8AE0.6020206@nvidia.com>
References: <1330536689-9121-5-git-send-email-sjg@chromium.org> <1330536689-9121-6-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1330536689-9121-6-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Yen Lin <yelin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/29/2012 10:31 AM, Simon Glass wrote:
> From: Yen Lin <yelin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Add basic i2c driver for Tegra2 with 8- and 16-bit address support.
> The driver requires CONFIG_OF_CONTROL to obtain its configuration
> from the device tree.

I only quickly scanned this for issues I vaguely recall from previous
reviews. I think this looks fine now.

-- 
nvpublic
