From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 3/4] sound/soc: tegra_max98090: document headphone jack
 rename
Date: Thu, 4 Feb 2016 09:39:08 -0700
Message-ID: <56B37EAC.5010101@wwwdotorg.org>
References: <1454563862-1971-1-git-send-email-sctincman@gmail.com>
 <1454563862-1971-4-git-send-email-sctincman@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454563862-1971-4-git-send-email-sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/03/2016 10:31 PM, Jonathan Tinkham wrote:
> Update device-tree bindings to reflect the rename of the board's
> headphone jack.

This looks like an incompatible change to the DT. While you've fixed the 
DT, which will fix new installations, old DTs now won't work. This 
breaks DT ABI. Any DT change needs to be backwards compatible, i.e. the 
old name should still work and be documented as a legacy value.
