From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v10 0/2] Silence missing-graph error for DRM bridges
Date: Wed, 1 Jul 2020 12:31:56 +0300
Message-ID: <f4d50b9f-06e8-b6f7-ea5c-7a71f27ae953@gmail.com>
References: <20200701074232.13632-1-digetx@gmail.com>
 <20200701090240.GA22218@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200701090240.GA22218-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

01.07.2020 12:02, Sam Ravnborg пишет:
> Hi Dmitry
> On Wed, Jul 01, 2020 at 10:42:30AM +0300, Dmitry Osipenko wrote:
>> Hi!
>>
>> This small series improves DRM bridges code by silencing a noisy error
>> coming from of-graph code for the device-trees that are missing a
>> display bridge graph.
>>
>>   graph: no port node found in ...
>>
>> One example where this error happens is an older bridge-less DTB used
>> in conjunction with a newer kernel which has a display controller driver
>> that supports DRM bridges.
>>
>> Changelog:
>>
>> v10:- Corrected doc-comment, unbroke the of_graph_get_next_endpoint() and
>>       improved commit's message in the "add of_graph_is_present()" patch.
>>       Thanks to Laurent Pinchart for spotting the problems!
>>
>> v9: - These two patches are factored out from [1] in order to ease applying
>>       of the patches.
>>
>>     - The of_graph_presents() is renamed to of_graph_is_present() like it
>>       was requested by Rob Herring in the review comment to [1].
>>
>>     - Added Rob's r-b.
>>
>>     [1] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=184102
>>
>> Dmitry Osipenko (2):
>>   of_graph: add of_graph_is_present()
>>   drm/of: Make drm_of_find_panel_or_bridge() to check graph's presence
> 
> Thanks for your patience with these - applied to drm-misc-next now.

Thanks to you and Laurent!
