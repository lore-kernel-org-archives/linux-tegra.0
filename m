From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC v2 2/3] power: power_supply: Add core support for supplied_nodes
Date: Mon, 4 Mar 2013 12:32:35 -0500
Message-ID: <5134DAB3.5000604@nvidia.com>
References: <1361488272-21010-1-git-send-email-rklein@nvidia.com> <1361488272-21010-3-git-send-email-rklein@nvidia.com> <5127D083.6020308@wwwdotorg.org> <5127EA13.9010403@nvidia.com> <512FB473.8060309@nvidia.com> <20130302224832.GA16720@lizard.sbx05280.losalca.wayport.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130302224832.GA16720-SAfYLu58TvsKrcn4e17nTyIbA2bwYUBrKwcig+XE9tjR7s880joybQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anton Vorontsov <anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 3/2/2013 5:48 PM, Anton Vorontsov wrote:
> On Thu, Feb 28, 2013 at 02:48:03PM -0500, Rhyland Klein wrote:
> [...]
>> Anton, David, would you be adverse to the changing of supplied_to
>> from being a
>> list of batteries stored in a charger to being a list of chargers
>> stored in batteries?
> I wonder if we can support both ways?..
>
> Thanks,
> Anton
Well, the interesting factor becomes either we end up with 2 arrays
(supplied_to, supplied_from) or we make 1 array (horray, save space!)
but need to then either have a flag or use the power_supply type to
know how to interpret the single array (as supplied_to or supplied_from).

Adding in the second array and adds a char ** and an int, which doesn't seem
like as much overhead as trying to figure out how to interpret the 
single array
so I am inclined to stick with 2 arrays.

-rhyland

-- 
nvpublic
