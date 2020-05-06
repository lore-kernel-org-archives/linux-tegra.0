From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 2/6] drm/of: Make drm_of_find_panel_or_bridge() to
 check graph's presence
Date: Wed, 6 May 2020 20:05:27 +0300
Message-ID: <f288e704-2fdb-d548-9f5b-8016412dfd3f@gmail.com>
References: <20200418170703.1583-1-digetx@gmail.com>
 <20200418170703.1583-3-digetx@gmail.com>
 <20200506164133.GB19296@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200506164133.GB19296-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

06.05.2020 19:41, Sam Ravnborg пишет:
> On Sat, Apr 18, 2020 at 08:06:59PM +0300, Dmitry Osipenko wrote:
>> When graph isn't defined in a device-tree, the of_graph_get_remote_node()
>> prints a noisy error message, telling that port node is not found. This is
>> undesirable behaviour in our case because absence of a panel/bridge graph
>> is a valid case. Let's check presence of the local port in a device-tree
>> before proceeding with parsing the graph.
>>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Reviewed-by: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>

Thank you again for taking a look at these patches!
