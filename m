From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v6 11/20] tegra: fdt: Add clock bindings for
 Tegra2 Seaboard
Date: Sat, 3 Mar 2012 08:26:47 -0800
Message-ID: <CAPnjgZ3kGdW_8LOZB=W5udTwm=JW=DGF8gKXOCNV83tzJXucAQ@mail.gmail.com>
References: <1330375973-10681-1-git-send-email-sjg@chromium.org>
	<1330375973-10681-12-git-send-email-sjg@chromium.org>
	<4F4C11E9.1050907@nvidia.com>
	<CAPnjgZ0_xzn0tvETt3C=pjyRX-MXNA-JXy4fuAs9L8OdHuvLhg@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF17BDDF1D6A@HQMAIL01.nvidia.com>
	<CAPnjgZ1LsFeADVHRcS694EwJrz3V+ONdp9ds+bdAG5rNupQ_ag@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF17BDDF1DB0@HQMAIL01.nvidia.com>
	<CAPnjgZ3vsw2rH1CdiN_3xzvJr2pUTn_SY4jNEf-w26cRK=3gmQ@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF17BDDF1DB8@HQMAIL01.nvidia.com>
	<CAPnjgZ0VGRSgb92u2UbNf+_HFF-EXhLZzC4XdYUvAjVKtz1XtQ@mail.gmail.com>
	<4F4D5258.7020901@aribaud.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4F4D5258.7020901@aribaud.net>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Albert ARIBAUD <albert.u.boot@aribaud.net>
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <TWarren@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Hi Albert,

On Tue, Feb 28, 2012 at 2:16 PM, Albert ARIBAUD
<albert.u.boot@aribaud.net> wrote:
> Le 28/02/2012 19:46, Simon Glass a =E9crit :
>
>> Hi Stephen,
>>
>> On Tue, Feb 28, 2012 at 10:41 AM, Stephen Warren<swarren@nvidia.com>
>> =A0wrote:
>>>
>>> Simon Glass wrote at Tuesday, February 28, 2012 11:37 AM:
>>>>
>>>> On Tue, Feb 28, 2012 at 10:31 AM, Stephen Warren<swarren@nvidia.com>
>>>> =A0wrote:
>>>>>
>>>>> Simon Glass wrote at Tuesday, February 28, 2012 10:38 AM:
>>>>> ...
>>>>>>
>>>>>> I am going to add your binding, less the #clock-cells which U-Boot
>>>>>> currently can't support because it conflicts with the C preprocessor
>>>>>> (at some point I may look at a patch to use sed or some other means =
of
>>>>>> avoiding this).
>>>>>
>>>>>
>>>>> Out of curiosity, why does the C preprocessor come into it? Is U-Boot=
's
>>>>> build process running cpp on the .dts files or something? That's non-
>>>>> standard, although perhaps it could be a useful standard...
>>>>
>>>>
>>>> Yes, but at the moment we only use it for '/include/ ARCH_CPU_DTS'.
>>>
>>>
>>> Uggh. That's going to make the device tree files look different between
>>> the kernel and U-Boot:-( With # disallowed in particular, it's going to
>>> prevent U-Boot from /ever/ using the correct protocols for parsing the
>>> device tree. This seems like an extremely bad idea.
>>
>>
>> Until we change it in U-Boot, you mean. We could move to sed or pre-
>> and post-process the file to remove and re-insert the #.
>
>
> Rather, to convert # signs into something that the DTS cannot contain and
> the compiler can withstand (and it should be printable ASCII, too). is '#=
#'
> a good candidate?
>
> If so, a forward conversion would e.g. map '/include/' to '#include' and =
any
> '#' to '##', and the reverse conversion would turn all '##' to '#'.
>
> But something that simple is bound to be wrong in some way...

It seems reasonable, although the /include/ is handled by the dtc
itself. If we bypath that then line number reporting won't work.
However I do have problems getting dtc to find its include files - I
wish it had a -I option.

I will take a look at this in a few weeks once this series in is and I
have looked at the include file problem in more detail.

Regards,
Simon

>
> Amicalement,
> --
> Albert.
