From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V4 1/9] gpio: tegra: add gpio wakeup source handling
Date: Tue, 19 Mar 2013 10:52:21 -0600
Message-ID: <514897C5.1000705@wwwdotorg.org>
References: <1363594400-11663-1-git-send-email-josephl@nvidia.com> <1363594400-11663-2-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363594400-11663-2-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/18/2013 02:13 AM, Joseph Lo wrote:
> This patch add the gpio wakeup source handling for the Tegra platform. It
> was be done by enabling the irq for the gpio in the gpio controller and
> enabling the bank irq of the gpio in the Tegra legacy irq controller when
> the system going to suspend.

Grant, Linus, are you OK with this change? Could I please get an Ack to
take it through the Tegra tree? Thanks.
