From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: remove clock-frequency properties from serial
 nodes
Date: Tue, 12 Feb 2013 10:47:33 -0700
Message-ID: <511A8035.6080808@wwwdotorg.org>
References: <1360691025-8393-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1360691025-8393-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/12/2013 10:43 AM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Currently, the serial nodes define both a clock-frequency and a clocks
> property. We should not provide both, since they might conflict.
> 
> In practice, this also causes problems since the of_serial driver uses
> the clock-frequency property in preference to the clocks property, and
> hence doesn't clk_prepare_enable() the clock, which may then leave it
> with no known users, and hence the common clock framework will disable
> it, thus breaking the port, which is usually the console.

I've applied this to Tegra's for-3.9/soc-ccf-fixes branch, although I'll
hold off on pushing it out a little while in case anyone has comments on
it. That said, I hope to include it in an arm-soc pull request tomorrow
at the latest.
