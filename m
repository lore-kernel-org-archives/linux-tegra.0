From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC PATCH 0/5] Minor bugfixes for Tegra kernels
Date: Wed, 16 Jan 2013 18:37:35 -0800
Message-ID: <CAMbhsRTc4m-4pRF9+w=6ekueQiwaa8N1vOaX2vggd0Pi_MqAFQ@mail.gmail.com>
References: <1358366173-56861-1-git-send-email-jeremya@cs.columbia.edu>
	<50F71F5C.6020209@wwwdotorg.org>
	<1024EDB1-9A14-4308-8245-7EFB98ADBD0E@cs.columbia.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1024EDB1-9A14-4308-8245-7EFB98ADBD0E-eQaUEPhvms7ENvBUuze7eA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeremy Andrus <jeremya-eQaUEPhvms7ENvBUuze7eA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 16, 2013 at 6:07 PM, Jeremy Andrus <jeremya-eQaUEPhvms7ENvBUuze7eA@public.gmane.org=
> wrote:
> On Jan 16, 2013, at 4:45 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> w=
rote:
>
>> On 01/16/2013 12:56 PM, Jeremy C. Andrus wrote:
>>> From: "Jeremy C. Andrus" <jeremya-eQaUEPhvms7ENvBUuze7eA@public.gmane.org>
>>>
>>> In the course of my research here at Columbia University, I have be=
en
>>> doing some kernel development on the Google Nexus 7 device. I took =
the
>>> time to address most of the compile-time warnings while building th=
e
>>> Tegra kernel tree using the cross-compiler shipped with Android
>>> (gcc-4.7), and in doing so I came across a few minor issues.
>>>
>>> This RFC series addresses several minor bugs that I was able to fix
>>> while suppressing compile warnings. Not knowing exactly where
>>> to send the patches, I decided to send them primarily to the Tegra
>>> list serv in hopes that they will find their way to the correct pla=
ce.
>>>
>>> All 5 patches apply cleanly the kernel/tegra repository hosted by
>>> Google. I used the commit hash referenced in the Android device tre=
e
>>> git logs as my HEAD revision: 22b4fcde206e96f57bf0a111403fc3d755329=
18a
>>> I belive that this is the revision which corresponds to the prebuil=
t
>>> kernel provided in the Jelly Bean release.
>>
>> I honestly don't know where you should send these patches. I've CC'd
>> Colin Cross who works on Android in case he can clue us in. I assume
>> there's a Gerrit instance somewhere for Android that you need to pus=
h
>> these into...
>>
>> Laxman, can you please check if any of these patches should be appli=
ed
>> to our internal/downstream kernels?
>
> The first patch actually fixed my build! When using the prebuilt tool=
chains
> provided by google (as per Android build instructions), the build fai=
led on
> arch/arm/mach-tegra/sleep.S. This seems to be because the Makefile
> function $(call as-instr,=85) didn't function properly. I would think=
 that some
> sort of fix to make the Tegra tree build-able using Android toolchain=
s
> would be appropriate here...

I don't think this has anything to do with Android except that the
toolchain shipped with Android moved to a newer version of binutils.
The as-instr in the Makefile should work fine and I believe is the
preferable solution over adding the arch_extension to sleep.S, maybe
it has a typo?

>> Jeremy, do patches 3 or 4 need to be applied to the mainline kernel?=
 It
>> may be useful for you to resend those directly to the relevant upstr=
eam
>> subsystem maintainers, after rebasing them onto the latest upstream
>> code. See Documentation/SubmittingPatches in the mainline kernel.
>
> OK. I will send those patches out to subsystem maintainers (assuming =
that
> they are not already fixed).
>
>> Thanks for the contributions!
>
>
> You're welcome! This was my first experience with git-format-patch, a=
nd
> it was kind of fun to re-contribute in a small way.
>
> I actually have another set of patches that fix all the build warning=
s. Is
> there a repo / branch that I should rebase these on and then send the=
m
> out? It was definitely worth the effort to eliminate all the warnings=
 - it
> made it a lot easier to spot my own mistakes :-)
>
> Best,
>
>         -Jeremy
>
