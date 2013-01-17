From: Jeremy Andrus <jeremya-eQaUEPhvms7ENvBUuze7eA@public.gmane.org>
Subject: Re: [RFC PATCH 0/5] Minor bugfixes for Tegra kernels
Date: Wed, 16 Jan 2013 21:07:45 -0500
Message-ID: <1024EDB1-9A14-4308-8245-7EFB98ADBD0E@cs.columbia.edu>
References: <1358366173-56861-1-git-send-email-jeremya@cs.columbia.edu> <50F71F5C.6020209@wwwdotorg.org>
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50F71F5C.6020209-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Jan 16, 2013, at 4:45 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wro=
te:

> On 01/16/2013 12:56 PM, Jeremy C. Andrus wrote:
>> From: "Jeremy C. Andrus" <jeremya-eQaUEPhvms7ENvBUuze7eA@public.gmane.org>
>>=20
>> In the course of my research here at Columbia University, I have bee=
n
>> doing some kernel development on the Google Nexus 7 device. I took t=
he
>> time to address most of the compile-time warnings while building the
>> Tegra kernel tree using the cross-compiler shipped with Android
>> (gcc-4.7), and in doing so I came across a few minor issues.
>>=20
>> This RFC series addresses several minor bugs that I was able to fix
>> while suppressing compile warnings. Not knowing exactly where
>> to send the patches, I decided to send them primarily to the Tegra
>> list serv in hopes that they will find their way to the correct plac=
e.
>>=20
>> All 5 patches apply cleanly the kernel/tegra repository hosted by
>> Google. I used the commit hash referenced in the Android device tree
>> git logs as my HEAD revision: 22b4fcde206e96f57bf0a111403fc3d7553291=
8a
>> I belive that this is the revision which corresponds to the prebuilt
>> kernel provided in the Jelly Bean release.
>=20
> I honestly don't know where you should send these patches. I've CC'd
> Colin Cross who works on Android in case he can clue us in. I assume
> there's a Gerrit instance somewhere for Android that you need to push
> these into...
>=20
> Laxman, can you please check if any of these patches should be applie=
d
> to our internal/downstream kernels?

The first patch actually fixed my build! When using the prebuilt toolch=
ains
provided by google (as per Android build instructions), the build faile=
d on
arch/arm/mach-tegra/sleep.S. This seems to be because the Makefile
function $(call as-instr,=85) didn't function properly. I would think t=
hat some
sort of fix to make the Tegra tree build-able using Android toolchains
would be appropriate here...

> Jeremy, do patches 3 or 4 need to be applied to the mainline kernel? =
It
> may be useful for you to resend those directly to the relevant upstre=
am
> subsystem maintainers, after rebasing them onto the latest upstream
> code. See Documentation/SubmittingPatches in the mainline kernel.

OK. I will send those patches out to subsystem maintainers (assuming th=
at
they are not already fixed).=20

> Thanks for the contributions!


You're welcome! This was my first experience with git-format-patch, and
it was kind of fun to re-contribute in a small way.

I actually have another set of patches that fix all the build warnings.=
 Is
there a repo / branch that I should rebase these on and then send them
out? It was definitely worth the effort to eliminate all the warnings -=
 it
made it a lot easier to spot my own mistakes :-)

Best,

        -Jeremy
