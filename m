From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/1] tps65090-charger: Fix AC detect
Date: Fri, 7 Jun 2013 12:07:39 -0400
Message-ID: <51B2054B.7030609@nvidia.com>
References: <1370553163-31804-1-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370553163-31804-1-git-send-email-achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "cbou-JGs/UdohzUI@public.gmane.org" <cbou-JGs/UdohzUI@public.gmane.org>, "dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 6/6/2013 5:12 PM, Andrew Chew wrote:
> The VACG interrupt was not being enabled.  Thus, interrupts were never
> generated when AC status changes.  In addition, interrupts were never
> cleared after taking and processing the interrupt.
> 
> Added the register offset for the INTR_MASK register, since this is needed
> to unmask the VACG interrupt.
> 
> Enabled the VACG interrupt in tps65090_config_charger().
> 
> Cleared interrupts after processing, in tps65090_charger_isr().
> 
> Also removed unused variable "enable" in tps65090_enable_charging(),
> and fixed a typo in one of the dev_err() prints.
> 
> Signed-off-by: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---

Great! Tested and it works great on my Dalmore.

Tested-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

-rhyland

-- 
nvpublic
