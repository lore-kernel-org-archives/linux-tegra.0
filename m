From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 0/9] ARM: tegra: add platform suspend support
Date: Tue, 12 Mar 2013 13:32:59 -0600
Message-ID: <513F82EB.1030407@wwwdotorg.org>
References: <1363060916-8897-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363060916-8897-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/11/2013 10:01 PM, Joseph Lo wrote:
> This series introduces a basic functionality for Tegra to support the
> platform suspend and resume.
> 
> Note: This series only adds the support for Tegra20 and Tegra30. The
> Tegra114 will be supported later.

Aside from the few issues that have already been pointed out, this looks
OK now. I have a couple questions:

1) Please remind me if this series depends on anything. If not, I hope
to apply it mostly directly on top of 3.9-rc1 or so.

2) You mentioned that Tegra114 isn't supported. What is the failure mode
on Tegra114? Is suspend simply not available and hence can't be
requested, or will suspend attempts gracefully return an error, or will
there we crashes, boot failures, etc.?

3) Sorry for asking this again, but since only LP2 is actually
implemented in patch 4, what happens if the user selects LP0 or LP1?
Does the system (a) just use LP2, (b) fail to suspend, and hence
immediately resume, (c) suspend, but can't be resumed, ...?

Thanks.
