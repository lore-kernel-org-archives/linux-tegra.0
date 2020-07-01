From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v9 1/2] of_graph: add of_graph_is_present()
Date: Wed, 1 Jul 2020 09:42:51 +0300
Message-ID: <c39beae6-34d4-84c3-07c0-e6639ab0b367@gmail.com>
References: <20200701021617.12030-1-digetx@gmail.com>
 <20200701021617.12030-2-digetx@gmail.com>
 <20200701054543.GA5963@pendragon.ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200701054543.GA5963-N3hz7ZxfLydczECFQUw77jytWr6r+dGw0E9HWUfgJXw@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

01.07.2020 08:45, Laurent Pinchart пишет:
> Hi Dmitry,
> 
> Thank you for the patch.
> 
> On Wed, Jul 01, 2020 at 05:16:16AM +0300, Dmitry Osipenko wrote:
>> In some case, like a DRM display code for example, it's useful to silently
>> check whether port node exists at all in a device-tree before proceeding
>> with parsing of the graph.
>>
>> This patch adds of_graph_is_present() which returns true if given
>> device-tree node contains OF graph port.
>>
>> Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/of/property.c    | 52 +++++++++++++++++++++++++++++++++-------
>>  include/linux/of_graph.h |  6 +++++
>>  2 files changed, 49 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/of/property.c b/drivers/of/property.c
>> index 6a5760f0d6cd..e12b8b491837 100644
>> --- a/drivers/of/property.c
>> +++ b/drivers/of/property.c
>> @@ -29,6 +29,48 @@
>>  
>>  #include "of_private.h"
>>  
>> +/**
>> + * of_graph_get_first_local_port() - get first local port node
>> + * @node: pointer to a local endpoint device_node
> 
> It's not an endpoint.

Alright, somehow I was reading this as a "device_node that contains
endpoint (of the graph)". But after re-reading twice I can see that it's
not the case.

It should be a "pointer to device_node containing graph port", just like
the of_graph_get_remote_node() says it. Thank you :)

>> + *
>> + * Return: First local port node associated with local endpoint node linked
>> + *	   to @node. Use of_node_put() on it when done.
>> + */
>> +static struct device_node *
>> +of_graph_get_first_local_port(const struct device_node *node)
>> +{
>> +	struct device_node *ports, *port;
>> +
>> +	ports = of_get_child_by_name(node, "ports");
>> +	if (ports)
>> +		node = ports;
>> +
>> +	port = of_get_child_by_name(node, "port");
>> +	of_node_put(ports);
>> +
>> +	return port;
>> +}
>> +
>> +/**
>> + * of_graph_is_present() - check graph's presence
>> + * @node: pointer to a device_node checked for the graph's presence
>> + *
>> + * Return: True if @node has a port or ports sub-node, false otherwise.
>> + */
>> +bool of_graph_is_present(const struct device_node *node)
>> +{
>> +	struct device_node *local;
>> +
>> +	local = of_graph_get_first_local_port(node);
>> +	if (!local)
>> +		return false;
>> +
>> +	of_node_put(local);
>> +
>> +	return true;
>> +}
>> +EXPORT_SYMBOL(of_graph_is_present);
>> +
>>  /**
>>   * of_property_count_elems_of_size - Count the number of elements in a property
>>   *
>> @@ -608,15 +650,7 @@ struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
>>  	 * parent port node.
>>  	 */
>>  	if (!prev) {
>> -		struct device_node *node;
>> -
>> -		node = of_get_child_by_name(parent, "ports");
>> -		if (node)
>> -			parent = node;
>> -
>> -		port = of_get_child_by_name(parent, "port");
>> -		of_node_put(node);
>> -
>> +		port = of_graph_get_first_local_port(parent);
> 
> I think this introduces a bug below in the function, where parent is
> used and is expected to point to the ports node if available. I'd leave
> this part of the change out, and inline +of_graph_get_first_local_port()
> in of_graph_is_present().

Good catch! I'll correct this.

Thank you for the review :)
