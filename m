From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [v2 1/1] ARM: dt: tegra{20,30}.dtsi: Rename "MC" to "Memory Controller"
Date: Wed, 16 May 2012 09:49:27 -0600
Message-ID: <4FB3CC87.4030505@wwwdotorg.org>
References: <1337151226-7266-1-git-send-email-hdoyu@nvidia.com> <1337172241-28677-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1337172241-28677-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/16/2012 06:44 AM, Hiroshi DOYU wrote:
> Use a more plain english name.

It's probably too late taking this cosmetic change for 3.5.

There is also an "emc" node that probably should be renamed to
memory-controller too. In that case, since there will be two
memory-controller nodes, you'll need to add the unit address
("@xxxxxxxx") back on the end of both the node names.

Can I get a patch series that does all that and updates the binding
documentation for both MC and EMC? Probably separate patches for MC and EMC.

Thanks.
