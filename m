From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 6/7] i2c: ChromeOS EC tunnel driver
Date: Tue, 20 May 2014 11:35:59 -0600
Message-ID: <537B927F.4070504@wwwdotorg.org>
References: <1398879850-9111-1-git-send-email-dianders@chromium.org> <1398879850-9111-7-git-send-email-dianders@chromium.org> <20140520084702.GG24991@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140520084702.GG24991@lee--X1>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/20/2014 02:47 AM, Lee Jones wrote:
> On Wed, 30 Apr 2014, Doug Anderson wrote:
> 
>> On ARM Chromebooks we have a few devices that are accessed by both the
>> AP (the main "Application Processor") and the EC (the Embedded
>> Controller).  These are:
>> * The battery (sbs-battery).
>> * The power management unit tps65090.
>>
>> On the original Samsung ARM Chromebook these devices were on an I2C
>> bus that was shared between the AP and the EC and arbitrated using
>> some extranal GPIOs (see i2c-arb-gpio-challenge).
...
> Applied, thanks.

Was the branch pushed too? I can't see these patches at
git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
(or master or for-mfd-fixes)
