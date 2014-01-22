From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 0/5] ARM: firmware: improvements to Trusted Foundations
 support
Date: Wed, 22 Jan 2014 13:47:07 -0700
Message-ID: <52E02E4B.5060206@wwwdotorg.org>
References: <1390299016-14105-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390299016-14105-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/21/2014 03:10 AM, Alexandre Courbot wrote:
> These (mostly minor) patches fix a few typos, improve points that
> were agreed upon when the Trusted Foundation series was initially
> submitted, and more importantly add support for the do_idle() firmware
> operation that is needed for cpuidle to be supported. Tegra's cpuidle
> driver is also updated accordingly.
> 
> These patches should be the last step before the device trees for NVIDIA
> SHIELD and Tegra Note 7 can be submitted.

Russell, once these patches are reviewed, should Alex submit them to the
ARM patch tracker, or will you Ack them so they can go through the Tegra
tree? Either way I can put them in a separate branch based on 3.14-rc1
in order to easily resolve any conflicts.
