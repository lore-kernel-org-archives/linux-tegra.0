From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] [PATCH] ARM: tegra: emc: device tree bindings
Date: Wed, 19 Oct 2011 09:36:42 -0500
Message-ID: <4E9EE07A.20301@gmail.com>
References: <1318873976-25335-1-git-send-email-olof@lixom.net> <74CDBE0F657A3D45AFBB94109FB122FF173CA2CBFB@HQMAIL01.nvidia.com> <CAOesGMh387Oghyd_TobnTOja6tU2uU5kt-86_HwQe7nFiL+svw@mail.gmail.com> <74CDBE0F657A3D45AFBB94109FB122FF173CA2CC18@HQMAIL01.nvidia.com> <CAOesGMghu6Bn3RrFKEUBKkUNS_K8Y0ho3Y2uFZh_LXbfT80hFw@mail.gmail.com> <74CDBE0F657A3D45AFBB94109FB122FF173CA2CCA9@HQMAIL01.nvidia.com> <4E9E3801.6080707@gmail.com> <CAOesGMj8TREZ94RFhE3Qy=eaytOuB0YKBWw6--HAERoMB9m7Qg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMj8TREZ94RFhE3Qy=eaytOuB0YKBWw6--HAERoMB9m7Qg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/18/2011 10:28 PM, Olof Johansson wrote:
> On Tue, Oct 18, 2011 at 7:37 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On 10/18/2011 04:01 PM, Stephen Warren wrote:
>>> I only suggested the well-known-named sub-nodes in order to eliminate
>>> the need for a compatible property.
>>>
>>> My inclination is that if we use compatible to distinguish the tables
>>> from anything else, there's little point having the extra level of nodes;
>>> we may as well lay it out as in your original patch, just with an explicit
>>> nvidia,ram-code property in each table (or omitted/ignored when not using
>>> it) instead of reg?
>>
>> Node names should be generic like serial or ethernet. Compatible is used
>> to specify the specific model.
> 
> In cases where unit addresses can be used to separate out identical
> entries, yes. For something like this, there's no logical addressing
> of the tables so something else must be used to distinguish them.

Using the frequency as was previously proposed would work assuming that
is unique.

Rob
