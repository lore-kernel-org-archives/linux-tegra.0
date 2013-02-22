From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC v2 1/3] power_supply: Define Binding for supplied-nodes
Date: Fri, 22 Feb 2013 17:05:10 -0500
Message-ID: <5127EB96.3000206@nvidia.com>
References: <1361488272-21010-1-git-send-email-rklein@nvidia.com> <1361488272-21010-2-git-send-email-rklein@nvidia.com> <5127CAF9.1030506@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5127CAF9.1030506-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Anton Vorontsov <cbou-JGs/UdohzUI@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 2/22/2013 2:46 PM, Stephen Warren wrote:
> On 02/21/2013 04:11 PM, Rhyland Klein wrote:
>> This property is meant to be used in device nodes which represent
>> power_supply devices that wish to provide a list of supplies to
>> which they provide power. A common case is a AC Charger with
>> the batteries it powers.
>> diff --git a/Documentation/devicetree/bindings/power_supply/power_supply.txt b/Documentation/devicetree/bindings/power_supply/power_supply.txt
>> +Optional Properties:
>> + - power-supply : This property is added to a supply in order to list the
>> +   devices which supply it power, referenced by their phandles.
> DT properties that reference resources are usually named in the plural,
> so "power-supplies" would be more appropriate here.
>
> It seems plausible that a single DT node could represent/instantiate
> multiple separate supply objects. I think we want to employ the standard
> pattern of <phandle args*> rather than just <phandle>.
>
> That way, each supply that can supply others would have something like a
> #supply-cells = <n>, where n is the number of cells that the supply uses
> to name the multiple supplies provided by that node. 0 would be a common
> value here. 1 might be used for a node that represents many supplies.
>
> When a client supply uses a providing supply as the supply(!), do you
> need any flags to parameterize the connection? If so, that might be
> cause for a supplier to have a larger #supply-cells, so the flags could
> be represented.
>
> That all said, regulators assume 1 node == 1 regulator, so an
> alternative would be for a multi-supply node to include a child node per
> supply, e.g.:
>
> power@xxx {
>      ...
>      supply1 {
>          ...
>      };
>      supply2 {
>          ...
>      };
> };
>
> client {
>      supplies = <&supply1> <&supply2>;
> };
>
> I don't recall why regulators went for the style above rather than the
> #supply-cells style. Cc Mark Brown for any comment here.
>
> Also, do supplies and regulators need to inter-operate in any way (e.g.
> reference each-other in DT)?
>
>> +Example:
>> +
>> +	usb-charger: power@e {
>> +		compatible = "some,usb-charger";
>> +		...
>> +	};
>> +
>> +	ac-charger: power@e {
>> +		compatible = "some,ac-charger";
>> +		...
>> +	};
>> +
>> +	battery@b {
>> +		compatible = "some,battery";
>> +		...
>> +		power-supply = <&usb-charger>, <&ac-charger>;
>> +	};

The "connection" between supplier and supplies isn't really a hard 
connection.
Essentially, the core code uses the names/nodes in the list and iterates 
over
all the power_supplies that are registered and does matching.

I don't have any experience working with a single node that would spawn 
multiple
supplies, though the situation I am sure is possible. I am interested to 
see what
the consensus is around this design for multiple supplies, as I don't have a
preference either way.

-rhyland

-- 
nvpublic
