From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 01/10] gpio: tegra: add gpio wakeup source handling
Date: Wed, 27 Mar 2013 09:05:27 +0100
Message-ID: <CACRpkdY=218ms+q1UnARjCWot-XcYs62XEc4bT2Czu8PGfmtAw@mail.gmail.com>
References: <1362397186-5444-1-git-send-email-josephl@nvidia.com>
	<5136381B.6000300@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5136381B.6000300-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Mar 5, 2013 at 7:23 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 03/04/2013 04:39 AM, Joseph Lo wrote:
>> This patch add the gpio wakeup source handling for the Tegra platform. It
>> was be done by enabling the irq for the gpio in the gpio controller and
>> enabling the bank irq of the gpio in the Tegra legacy irq controller when
>> the system going to suspend.
>
> Grant, Linus, I assume there's a runtime dependency of the rest of this
> series on this first patch. Can I get an ack to take this patch through
> the Tegra tree? Thanks.

Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Sorry for taking what, 22 days to ACK this... :(

Yours,
Linus Walleij
