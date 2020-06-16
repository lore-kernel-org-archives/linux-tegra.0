From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 2/6] drm/of: Make drm_of_find_panel_or_bridge() to
 check graph's presence
Date: Tue, 16 Jun 2020 17:42:48 +0300
Message-ID: <4f0bb2e8-3522-4a3e-4ebd-32f9d5bc2da5@gmail.com>
References: <20200614172234.8856-1-digetx@gmail.com>
 <20200614172234.8856-3-digetx@gmail.com>
 <20200616012652.GG1629@pendragon.ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200616012652.GG1629@pendragon.ideasonboard.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

16.06.2020 04:26, Laurent Pinchart пишет:
> Hi Dmitry,
> 
> Thank you for the patch.
> 
> On Sun, Jun 14, 2020 at 08:22:30PM +0300, Dmitry Osipenko wrote:
>> When graph isn't defined in a device-tree, the of_graph_get_remote_node()
>> prints a noisy error message, telling that port node is not found. This is
>> undesirable behaviour in our case because absence of a panel/bridge graph
>> is a valid case. Let's check presence of the local port in a device-tree
>> before proceeding with parsing the graph.
>>
>> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/gpu/drm/drm_of.c | 13 ++++++++++++-
>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
>> index b50b44e76279..e0652c38f357 100644
>> --- a/drivers/gpu/drm/drm_of.c
>> +++ b/drivers/gpu/drm/drm_of.c
>> @@ -239,13 +239,24 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
>>  				struct drm_bridge **bridge)
>>  {
>>  	int ret = -EPROBE_DEFER;
>> -	struct device_node *remote;
>> +	struct device_node *local, *remote;
>>  
>>  	if (!panel && !bridge)
>>  		return -EINVAL;
>>  	if (panel)
>>  		*panel = NULL;
>>  
>> +	/*
>> +	 * of_graph_get_remote_node() produces a noisy error message if port
>> +	 * node isn't found and the absence of the port is a legit case here,
>> +	 * so at first we silently check presence of the local port.
>> +	 */
>> +	local = of_graph_get_local_port(np);
>> +	if (!local)
>> +		return -ENODEV;
>> +
>> +	of_node_put(local);
>> +
> 
> The code looks fine, but you may want to take into account my proposal
> in 1/7 to instead create a of_graph_has_port() function. The could would
> be simpler here.
> 
>>  	remote = of_graph_get_remote_node(np, port, endpoint);
>>  	if (!remote)
>>  		return -ENODEV;
> 

I like yours proposals and will prepare v8 based on them, thanks!
