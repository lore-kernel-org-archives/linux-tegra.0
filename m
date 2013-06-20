From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V1] ARM: dts: tegra: Modify pcie memory space size
Date: Thu, 20 Jun 2013 10:24:39 -0600
Message-ID: <51C32CC7.5010109@wwwdotorg.org>
References: <1371712491-31070-1-git-send-email-jagarwal@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371712491-31070-1-git-send-email-jagarwal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jay Agarwal <jagarwal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jtukkinen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/20/2013 01:14 AM, Jay Agarwal wrote:
> - decrease non-prefetch memory size to 128 MB
> - increase prefetch memory size to 384 MB
> - above change is done because most pcie devices
>   prefetch memory size requirement is quite higher
>   compared to non-prefetch memory space.

It's possible this change won't be suitable for all applications. People
may simply need to adjust their DT based on what they want to connect.
Still, this patch probably biases things in the correct way for now.
Longer term, we might want to investigate dynamically sizing the windows
in order to support arbitrary attached devices, in much the same way as
the Marvell code does/will in order to conserve physical/bus address
space for their multiple controllers.

However, this change allows me to correctly enumerate a particular GPU I
have plugged into my Harmony board, and assign all the BARs, so:

Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
