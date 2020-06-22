From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 1/2] drm/panel-simple: Correct EDT ET057090DHU
 connector type
Date: Mon, 22 Jun 2020 16:40:42 +0300
Message-ID: <0974c58b-71e8-623e-cb04-d19a5167a30c@gmail.com>
References: <20200621222742.25695-1-digetx@gmail.com>
 <20200621222742.25695-2-digetx@gmail.com>
 <20200621222922.GA25355@pendragon.ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200621222922.GA25355-N3hz7ZxfLydczECFQUw77jytWr6r+dGw0E9HWUfgJXw@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

22.06.2020 01:29, Laurent Pinchart пишет:
> Hi Dmitry,
> 
> Thank you for the patch.
> 
> On Mon, Jun 22, 2020 at 01:27:41AM +0300, Dmitry Osipenko wrote:
>> The EDT ET057090DHU panel has a DPI connector and not LVDS. This patch
>> corrects the panel's description.
>>
>> Reported-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
>> Fixes: 94f07917ebe8 ("drm/panel-simple: Add missing connector type for some panels")
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>

Thank you! :)
