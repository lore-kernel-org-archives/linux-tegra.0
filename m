From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC 2/2] ARM:Tegra: Device Tree Support: Initialize audio card
 gpio's from the device tree.
Date: Mon, 30 May 2011 00:22:49 -0600
Message-ID: <BANLkTimTMdzWUX=xr7TyVXwM5FoVvRz2Zg@mail.gmail.com>
References: <20110527205444.21000.90209.stgit@riker> <20110527205721.21000.78599.stgit@riker>
 <20110528012427.GB5971@opensource.wolfsonmicro.com> <BANLkTinKLcYmStvBEGDcN84BapJXe5Y5bg@mail.gmail.com>
 <20110530033826.GE4130@opensource.wolfsonmicro.com> <20110530061155.GC23517@ponder.secretlab.ca>
 <4DE336A1.5040509@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4DE336A1.5040509-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Cc: benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, May 30, 2011 at 12:18 AM, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org> wro=
te:
> On 5/29/2011 8:11 PM, Grant Likely wrote:
>>
>> On Mon, May 30, 2011 at 11:38:27AM +0800, Mark Brown wrote:
>>>
>>> On Sun, May 29, 2011 at 08:11:34PM -0700, Olof Johansson wrote:
>>>>
>>>> On Fri, May 27, 2011 at 6:24 PM, Mark Brown
>>>
>>>>> This is a step back from the usability of the existing platform d=
ata -
>>>>> the platform data uses a series of individually named GPIOs while=
 this
>>>>> uses an array of GPIO numbers with magic indexes. =A0The fact tha=
t you
>>>>> need comments explaining what the functions of the array elements=
 are
>>>>> is a bit of a red flag here.
>>>
>>>> Agreed, I had similar concerns with the sdhci bindings where it us=
ed a
>>>> 3-element array of gpios instead of the previous named ones. I was
>>>> told it's common practice to do it that way though? Seems like a s=
tep
>>>> backwards to me. :(
>>>
>>> Interesting... =A0what was the reasoning behind this? =A0It's a def=
inite
>>> step backwards but it does explain my major concern with the new ba=
tch
>>> of device tree patches.
>>
>> The binding for gpios was defined a few years ago and it is in fairl=
y
>> wide use within the powerpc sphere. =A0The design followed the patte=
rn
>> established for specifying irqs, and in that regard satisfied the
>> principle of least surprise.
>>
>> That said, it isn't a very large leap to go from a single 'gpios'
>> property to allowing multiple named gpios properties with meaningful
>> names, particularly if they are fully specified by the device
>> binding, and they follow exactly the same binding semantics as the
>> existing 'gpios' proprety (phandle + gpio specifier).
>>
>> Personally, I'm /cautious/ about saying okay to extending the bindin=
g,
>> simply because once the extension is in use it is really hard to go
>> back on it, but I cannot think of any reason why this particular cas=
e
>> wouldn't be a good idea. =A0Anyone have thoughts on this? =A0Ben? =A0=
Mitch?
>
>
> I'm currently dealing with an SoC that has over a hundred GPIOs. What=
ever we
> choose, I think it should be able to handle an insane number of GPIOs
> without getting any more cumbersome that is necessary.

That's pretty common, and I don't think it will be a problem; either
with the current binding, or the proposed extension.

g.

--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
