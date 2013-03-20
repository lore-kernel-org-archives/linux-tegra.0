From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: USB-related build errors on Tegra in next-20130319
Date: Wed, 20 Mar 2013 11:42:20 -0600
Message-ID: <5149F4FC.5040103@wwwdotorg.org>
References: <51489251.5040504@wwwdotorg.org> <20130320122031.GI29659@arwen.pp.htv.fi> <5149E62F.9090705@wwwdotorg.org> <20130320164553.GL1567@arwen.pp.htv.fi> <5149E925.7030302@wwwdotorg.org> <20130320171147.GM1567@arwen.pp.htv.fi> <5149F15A.1000806@wwwdotorg.org> <20130320173006.GN1567@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <20130320173006.GN1567@arwen.pp.htv.fi>
Sender: linux-next-owner@vger.kernel.org
To: balbi@ti.com
Cc: Venu Byravarasu <vbyravarasu@nvidia.com>, USB list <linux-usb@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 03/20/2013 11:30 AM, Felipe Balbi wrote:
> On Wed, Mar 20, 2013 at 11:26:50AM -0600, Stephen Warren wrote:
>> On 03/20/2013 11:11 AM, Felipe Balbi wrote:
>>> Hi,
>>> 
>>> On Wed, Mar 20, 2013 at 10:51:49AM -0600, Stephen Warren
>>> wrote:
>>>> On 03/20/2013 10:45 AM, Felipe Balbi wrote:
>>>>> Hi,
>>>>> 
>>>>> On Wed, Mar 20, 2013 at 10:39:11AM -0600, Stephen Warren 
>>>>> wrote:
>>>>>> On 03/20/2013 06:20 AM, Felipe Balbi wrote:
>>>> ...
>>>>>> The patch you gave fixes the Kconfig warnings, but not
>>>>>> the build failure.
>>>> ...
>>>>>> For now, I think the correct solution is to have 
>>>>>> USB_EHCI_TEGRA select USB_PHY. I validated that solves
>>>>>> the build problem, and has the bonus of not needing any
>>>>>> changes to tegra_defconfig.
>>>> ...
>>>>> Alright, do you want to send that patch ? My bad that I
>>>>> missed that build error...
>>>> 
>>>> Sure. Do you want to roll it into your patch and repost it,
>>>> or me to send a separate patch?
>> 
>> Oops, sorry, I meant to write "Do you want *me* to" ...
>> 
>>> updated patch below:
>> 
>> Anyway, the updated patch you sent does solve the problem, so:
>> 
>> Acked-by: Stephen Warren <swarren@nvidia.com> Tested-by: Stephen
>> Warren <swarren@nvidia.com> (both build and ran it on HW to make
>> sure nothing was missing)
>> 
>> Feel free to use yours or the separate one I sent; entirely your
>> call.
> 
> I wonder if the third option isn't nicer ?
> 
> select USB_PHY if USB select USB_ULPI select USB_ULPI_VIEWPORT
> 
> then all changes are in tegra's Kconfig itself ?

I imagine that'd work although I didn't try it. However, I suspect
it's more correct to have USB_EHCI_TEGRA do the select (or later, do a
depend), since that's the option which actually has the dependency.
Otherwise, you're just making USB_EHCI_TEGRA's dependencies work via
selects in some other pretty unrelated node.
