From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC v2 2/3] power: power_supply: Add core support for supplied_nodes
Date: Fri, 22 Feb 2013 13:09:39 -0700
Message-ID: <5127D083.6020308@wwwdotorg.org>
References: <1361488272-21010-1-git-send-email-rklein@nvidia.com> <1361488272-21010-3-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1361488272-21010-3-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Anton Vorontsov <cbou-JGs/UdohzUI@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/21/2013 04:11 PM, Rhyland Klein wrote:
> With the growing support for dt, it make sense to try to make use of
> dt features to make the general code cleaner. This patch is an
> attempt to commonize how chargers and their supplies are linked.
> 
> Following common dt convention, the "supplied-to" char** list is
> replaced with phandle lists defined in the supplies which contain
> phandles of their suppliers.
> 
> This has the effect however of introducing an inversion in the internal
> mechanics of how this information is stored. In the case of non-dt,
> the char** list of supplies is stored in the charger. In the dt case,
> a device_node * list is stored in the supplies of their chargers,
> however this seems to be the only way to support this.

grep over the whole kernel tree for supplied_to doesn't yield /too/ many
hits, although I didn't look at the complexity of most of them. Would it
be possible to invert all the current in-kernel uses to represent a
supplied_from/by model instead? That would mean the proposed DT binding
would then represent the same relationship ordering as the kernel code,
which would be easier to handle.
