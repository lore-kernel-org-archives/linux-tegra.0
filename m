From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: autobuild of tegrarcm
Date: Mon, 28 Jul 2014 09:25:26 -0600
Message-ID: <53D66B66.4010703@wwwdotorg.org>
References: <18236773.n1AHpLtjGA@fb07-iapwap2.physik.uni-giessen.de> <alpine.OSX.2.00.1305122142290.915@macbook-pro-de-lucile-perez.fritz.box> <20140727182320.GA14656@simplex.0x539.de> <15635619.1sXO2FqnMG@fb07-iapwap2>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <15635619.1sXO2FqnMG@fb07-iapwap2>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Philipp Kern <pkern-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: nonfree-sMDJvqjagnvx+JS5GvM4/R2eb7JE58TQ@public.gmane.org, Julian Andres Klode <jak-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, dktrkranz-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org, ftpmaster-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/28/2014 02:03 AM, Marc Dietrich wrote:
> added tegra ml, tegra maintainer, and tegrarcm maintainer.
>
> I think the license isn't appropriete for this software at all. See m=
y notes
> regarding this here [1]. So lets take the chance and ping nvidia agai=
n on this
> issue.

I'll ask Eric to comment on this again, although please note that he's=20
out on vacation this week.

That is, unless Allen has any comment?

> [1] http://www.spinics.net/lists/linux-tegra/msg11945.html
>
> Am Sonntag, 27. Juli 2014, 20:23:20 schrieb Philipp Kern:
>> Hi,
>>
>> On Sun, May 12, 2013 at 09:55:20PM +0200, Marc Dietrich wrote:
>>> On Sun, 12 May 2013, Philipp Kern wrote:
>>>> Hi,
>>>>
>>>> On Tue, Apr 23, 2013 at 11:31:21AM +0200, Marc Dietrich wrote:
>>>>> The proprietary license only applies to the binaries included in =
some
>>>>> header> >
>>>>> files. FYI, here is the license:
>>>> it seems like an oversight: LICENSE says "The files tegra20-minilo=
ader.h
>>>> and tegra30-miniloader.h are provided pursuant to the following li=
cense
>>>> agreement". But there is also tegra114-miniloader.h, which bears t=
he
>>>> same "not usable without a specific agreement" header.
>>>
>>> thanks for finding this. I think this can be fixed easily. I'll ask=
 my
>>> NVIDIA contact to update the LICENSE file regarding this.
>>>
>>>> Interestingly NVIDIA tells us in the license that it is "revocable=
",
>>>> which
>>>> is not the case for the graphics driver one. I presume we're alrea=
dy
>>>> talking about the binary code form here. It does not really make m=
e happy
>>>> that we can only distribute this to sublicensees that agree to be =
bound
>>>> by the license and to owners of NVIDIA hardware. Both is untrue wh=
en
>>>
>>>> looking at buildds. ):
>>> Does the term "revocable" cause problems with the distribution? Doe=
s this
>>> mean that users downloading the code (or the binary) must delete it=
 if
>>> NVIDIA tells debian to do so? Of course this is not possbile becaus=
e we
>>> don't know the identity of the users downloading this code. Also we=
 don't
>>> ask the users to aggree with the license before downloading/running=
 the
>>> program.
>>>
>>> The code in the miniloader files is not run on the machine which ru=
ns
>>> tegrarcm. It is run on the target SoC, which is likely Tegra, becau=
se all
>>> other SoCs won't run this bootloader. So I think this is more or le=
ss
>>> harmless.
>>
>> whenever I go back to this license, I feel bad about it. Adding Luca=
 who
>> accepted it.
>>
>> The graphic driver license clearly exempts Linux from the problemati=
c
>> provisions. The tegra one does not even try. Here's 2.1:
>>
>>   2.1  Rights and Limitations of Grant.  NVIDIA hereby grants to You=
 the
>>   following non-exclusive, non-transferable, revocable right under
>>   NVIDIA=E2=80=99s copyrights to use, copy, distribute and sublicens=
e the
>>   SOFTWARE (solely in binary code form) to Your sublicensees (a) sol=
ely
>>   for use in connection with NVIDIA hardware or software products; a=
nd
>>   (b) pursuant to the terms and conditions of any form of end-user
>>   software license agreement; provided, that Your sublicensees agree=
 to
>>   be bound by this LICENSE or terms and conditions that are as
>>   protective of NVIDIA=E2=80=99s Intellectual Property Rights in the=
 SOFTWARE as
>>   this LICENSE
>>
>> I'm unsure if the latter part means that the users need to consent b=
efore we
>> can offer it (e.g. click-through). Unless we do not actually sublice=
nse.
>> OTOH if we'd sublicense, then the users would not need to destroy co=
pies
>> when we need to.
>>
>> And then there's clause 3:
>>
>>   3.  TERM AND TERMINATION
>>   .
>>   This LICENSE and the licenses granted hereunder shall be effective=
 as
>>   of the date You download the applicable SOFTWARE (=E2=80=9CEffecti=
ve Date=E2=80=9D)
>>   and continue for a period of one (1) year (=E2=80=9CInitial Term=E2=
=80=9D)
>>   respectively, unless terminated earlier in accordance with the
>>   =E2=80=9CTermination=E2=80=9D provision of this LICENSE.  Unless e=
ither party notifies
>>   the other party of its intent to terminate this LICENSE at least t=
hree
>>   (3) months prior to the end of the Initial Term or the applicable
>>   renewal period, this License will be automatically renewed for one=
 (1)
>>   year renewal periods thereafter, unless terminated in accordance w=
ith
>>   the =E2=80=9CTermination=E2=80=9D provision of this LICENSE
>>   .
>>   NVIDIA may terminate this LICENSE at any time if You violate its
>>   terms. Upon termination, You will immediately destroy the SOFTWARE=
 or
>>   return all copies of the SOFTWARE to NVIDIA, and certify to NVIDIA=
 in
>>   writing that such actions have been completed.  Upon termination o=
r
>>   expiration of this LICENSE the license grants to Licensee shall
>>   terminate, except that sublicenses rightfully granted by Licensee
>>   under this LICENSE in connection with Paragraph 2 of this LICENSE
>>   provided by Licensee prior to the termination or expiration of thi=
s
>>   LICENSE shall survive in accordance with their respective form of
>>   license terms and conditions.
>>   [...]
>>
>> Do we have a precedent for such a clause? The whole language about o=
ne year
>> terms and announcements of termination worries me. That'd mean that
>> someone'd need to monitor NVIDIA's announcements and then request re=
moval
>> from a stable release in time? Or will that only happen towards sing=
le
>> users? (I.e. must the notification be direct?)
>>
>> I guess the language about NVIDIA's products can be ok, given that t=
he
>> compiled product is only useful on NVIDIA hardware anyway and will n=
ot be
>> executed on buildds=E2=80=A6
>>
>> Kind regards
>> Philipp Kern
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra=
" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
