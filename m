From: Jeremy Andrus <jchristian.andrus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 0/5] Minor bugfixes for Tegra kernels
Date: Thu, 17 Jan 2013 00:35:54 -0500
Message-ID: <409F0C97-CED0-4BB0-BD5C-6256122D0970@gmail.com>
References: <1358366173-56861-1-git-send-email-jeremya@cs.columbia.edu> <50F71F5C.6020209@wwwdotorg.org> <1024EDB1-9A14-4308-8245-7EFB98ADBD0E@cs.columbia.edu> <CAMbhsRTc4m-4pRF9+w=6ekueQiwaa8N1vOaX2vggd0Pi_MqAFQ@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMbhsRTc4m-4pRF9+w=6ekueQiwaa8N1vOaX2vggd0Pi_MqAFQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Jeremy Andrus <jeremya-eQaUEPhvms7ENvBUuze7eA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On Jan 16, 2013, at 9:37 PM, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org> wrote:

> On Wed, Jan 16, 2013 at 6:07 PM, Jeremy Andrus <jeremya-eQaUEPhvms5yEmSbqHaMZw@public.gmane.org=
du> wrote:
>> On Jan 16, 2013, at 4:45 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> =
wrote:
>>=20
>>> On 01/16/2013 12:56 PM, Jeremy C. Andrus wrote:
>>>> From: "Jeremy C. Andrus" <jeremya-eQaUEPhvms7ENvBUuze7eA@public.gmane.org>
>>>>=20
>>>> In the course of my research here at Columbia University, I have b=
een
>>>> doing some kernel development on the Google Nexus 7 device. I took=
 the
>>>> time to address most of the compile-time warnings while building t=
he
>>>> Tegra kernel tree using the cross-compiler shipped with Android
>>>> (gcc-4.7), and in doing so I came across a few minor issues.
>>>>=20
>>>> This RFC series addresses several minor bugs that I was able to fi=
x
>>>> while suppressing compile warnings. Not knowing exactly where
>>>> to send the patches, I decided to send them primarily to the Tegra
>>>> list serv in hopes that they will find their way to the correct pl=
ace.
>>>>=20
>>>> All 5 patches apply cleanly the kernel/tegra repository hosted by
>>>> Google. I used the commit hash referenced in the Android device tr=
ee
>>>> git logs as my HEAD revision: 22b4fcde206e96f57bf0a111403fc3d75532=
918a
>>>> I belive that this is the revision which corresponds to the prebui=
lt
>>>> kernel provided in the Jelly Bean release.
>>>=20
>>> I honestly don't know where you should send these patches. I've CC'=
d
>>> Colin Cross who works on Android in case he can clue us in. I assum=
e
>>> there's a Gerrit instance somewhere for Android that you need to pu=
sh
>>> these into...
>>>=20
>>> Laxman, can you please check if any of these patches should be appl=
ied
>>> to our internal/downstream kernels?
>>=20
>> The first patch actually fixed my build! When using the prebuilt too=
lchains
>> provided by google (as per Android build instructions), the build fa=
iled on
>> arch/arm/mach-tegra/sleep.S. This seems to be because the Makefile
>> function $(call as-instr,=85) didn't function properly. I would thin=
k that some
>> sort of fix to make the Tegra tree build-able using Android toolchai=
ns
>> would be appropriate here...
>=20
> I don't think this has anything to do with Android except that the
> toolchain shipped with Android moved to a newer version of binutils.
> The as-instr in the Makefile should work fine and I believe is the
> preferable solution over adding the arch_extension to sleep.S, maybe
> it has a typo?

I can take a look. I would agree that a Makefile solution slightly more=
 clean.
Unfortunately, the tree available from Google which corresponds to the
Jelly Bean release won't build with the Android toolchain. I tried both=
 the gcc-4.6
and gcc-4.7 prebuilts. It seems like the define in the file isn't a hor=
rible solution
though - the code obviously requires the extension...


>>> Jeremy, do patches 3 or 4 need to be applied to the mainline kernel=
? It
>>> may be useful for you to resend those directly to the relevant upst=
ream
>>> subsystem maintainers, after rebasing them onto the latest upstream
>>> code. See Documentation/SubmittingPatches in the mainline kernel.
>>=20
>> OK. I will send those patches out to subsystem maintainers (assuming=
 that
>> they are not already fixed).
>>=20
>>> Thanks for the contributions!
>>=20
>>=20
>> You're welcome! This was my first experience with git-format-patch, =
and
>> it was kind of fun to re-contribute in a small way.
>>=20
>> I actually have another set of patches that fix all the build warnin=
gs. Is
>> there a repo / branch that I should rebase these on and then send th=
em
>> out? It was definitely worth the effort to eliminate all the warning=
s - it
>> made it a lot easier to spot my own mistakes :-)
>>=20
>> Best,
>>=20
>>        -Jeremy
>>=20

--=20
--------------------------------------------------
Jeremy C. Andrus

e: jchristian.andrus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
w: http://jeremya.com/
l: New York, NY
p: 616,439,0522
--------------------------------------------------
