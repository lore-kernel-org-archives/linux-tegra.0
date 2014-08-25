From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 10/9] pinctrl: tegra-xusb: Support adjusted HS_CURR_LEVEL
Date: Mon, 25 Aug 2014 13:39:20 -0600
Message-ID: <53FB90E8.4050709@wwwdotorg.org>
References: <1408381705-3623-1-git-send-email-abrestic@chromium.org> <1408732088-28010-1-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1408732088-28010-1-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomeu Vizoso <tomeu-XCtybt49RKsYaV1qd6yewg@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/22/2014 12:28 PM, Andrew Bresticker wrote:
> On some boards, e.g. Blaze, the fused per-UTMI pad HS_CURR_LEVEL value
> must be adjusted before being applied.  Add support for a new pinconfig
> property "nvidia,otg-hs-curr-level-offset" which will apply the specified
> offset to the fused HS_CURR_LEVEL value.

I'd like a review from Thierry on this one too.

Patches 7-10 seem OK to me.
