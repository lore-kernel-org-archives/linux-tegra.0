From: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v5 1/6] of_graph: add of_graph_get_local_port()
Date: Wed, 6 May 2020 18:32:37 +0200
Message-ID: <20200506163237.GA19296@ravnborg.org>
References: <20200418170703.1583-1-digetx@gmail.com>
 <20200418170703.1583-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200418170703.1583-2-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Dmitry

On Sat, Apr 18, 2020 at 08:06:58PM +0300, Dmitry Osipenko wrote:
> In some case, like a DRM display code for example, it's useful to silently
> check whether port node exists at all in a device-tree before proceeding
> with parsing the graph.
> 
> This patch adds of_graph_get_local_port() which returns pointer to a local
> port node, or NULL if graph isn't specified in a device-tree for a given
> device node.
> 
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Nice little helper function.
Reviewed-by: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>

Rob - OK to commit to drm-misc-next?

	Sam

> ---
>  drivers/of/property.c    | 32 +++++++++++++++++++++++---------
>  include/linux/of_graph.h |  7 +++++++
>  2 files changed, 30 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 252e4f600155..5dbeccaabb86 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -608,15 +608,7 @@ struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
>  	 * parent port node.
>  	 */
>  	if (!prev) {
> -		struct device_node *node;
> -
> -		node = of_get_child_by_name(parent, "ports");
> -		if (node)
> -			parent = node;
> -
> -		port = of_get_child_by_name(parent, "port");
> -		of_node_put(node);
> -
> +		port = of_graph_get_local_port(parent);
>  		if (!port) {
>  			pr_err("graph: no port node found in %pOF\n", parent);
>  			return NULL;
> @@ -765,6 +757,28 @@ struct device_node *of_graph_get_remote_port(const struct device_node *node)
>  }
>  EXPORT_SYMBOL(of_graph_get_remote_port);
>  
> +/**
> + * of_graph_get_local_port() - get local port node
> + * @node: pointer to a local endpoint device_node
> + *
> + * Return: First local port node associated with local endpoint node linked
> + *	   to @node. Use of_node_put() on it when done.
> + */
> +struct device_node *of_graph_get_local_port(const struct device_node *node)
> +{
> +	struct device_node *ports, *port;
> +
> +	ports = of_get_child_by_name(node, "ports");
> +	if (ports)
> +		node = ports;
> +
> +	port = of_get_child_by_name(node, "port");
> +	of_node_put(ports);
> +
> +	return port;
> +}
> +EXPORT_SYMBOL(of_graph_get_local_port);
> +
>  int of_graph_get_endpoint_count(const struct device_node *np)
>  {
>  	struct device_node *endpoint;
> diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
> index 01038a6aade0..1fdeb72c7765 100644
> --- a/include/linux/of_graph.h
> +++ b/include/linux/of_graph.h
> @@ -54,6 +54,7 @@ struct device_node *of_graph_get_remote_port_parent(
>  struct device_node *of_graph_get_remote_port(const struct device_node *node);
>  struct device_node *of_graph_get_remote_node(const struct device_node *node,
>  					     u32 port, u32 endpoint);
> +struct device_node *of_graph_get_local_port(const struct device_node *node);
>  #else
>  
>  static inline int of_graph_parse_endpoint(const struct device_node *node,
> @@ -116,6 +117,12 @@ static inline struct device_node *of_graph_get_remote_node(
>  	return NULL;
>  }
>  
> +static inline struct device_node *of_graph_get_local_port(
> +					const struct device_node *node)
> +{
> +	return NULL;
> +}
> +
>  #endif /* CONFIG_OF */
>  
>  #endif /* __LINUX_OF_GRAPH_H */
> -- 
> 2.26.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
