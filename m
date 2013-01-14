From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH RFT 3/3] ARM: tegra: dts: seaboard: enable keyboard
Date: Mon, 14 Jan 2013 09:45:52 -0700
Message-ID: <50F43640.7060308@wwwdotorg.org>
References: <1357911185-11048-1-git-send-email-ldewangan@nvidia.com> <1357911185-11048-3-git-send-email-ldewangan@nvidia.com> <50F09BC7.90607@wwwdotorg.org> <20130111232438.GN23505@n2100.arm.linux.org.uk> <50F09FCB.70809@wwwdotorg.org> <20130111233615.GO23505@n2100.arm.linux.org.uk> <50F0A2A8.3080401@wwwdotorg.org> <50F13C34.3020808@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50F13C34.3020808-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/12/2013 03:34 AM, Laxman Dewangan wrote:
...
> Which is the tree on which Prashant changes are applied. I can debug
> from that tree.

git://nv-tegra.nvidia.com/user/swarren/linux-2.6 test-ccf-rework-v4

But as I said in some other email in response to Prashant, I'll go and
find out why the clk driver is returning NULL.

(Russell, while the clk API definition may allow NULL to be a legal clk
value, the actual implementation on Tegra at least doesn't consider NULL
to be a legal clk value, so it shouldn't be returned in the first
place). There's no issue here in the comprehension of the clk API.
