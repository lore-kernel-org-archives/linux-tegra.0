From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V3] pinctrl: tegra: add suspend/resume support
Date: Mon, 04 Mar 2013 17:38:38 -0700
Message-ID: <51353E8E.5020700@wwwdotorg.org>
References: <5097F013.8070002@wwwdotorg.org> <1352165844-4837-1-git-send-email-digetx@gmail.com> <50988701.5080602@wwwdotorg.org> <50990BE0.9040507@gmail.com> <50994AFB.8000802@wwwdotorg.org> <50996DCC.8030508@gmail.com> <509984F9.1060508@wwwdotorg.org> <513538BC.5070706@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <513538BC.5070706-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/04/2013 05:13 PM, Dmitry Osipenko wrote:
> 07.11.2012 01:45, Stephen Warren =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 11/06/2012 01:06 PM, Dmitry Osipenko wrote:
>>> 06.11.2012 21:38, Stephen Warren wrote:
>>>> OK, so only you and he have the binaries built from this repositor=
y? Or,
>>>> are those binaries distributed to other people too? If the binarie=
s are
>>>> distributed, you need to distribute (or offer to make available) t=
he
>>>> source too. See the GPL for exact requirements.
>>>
>>> I'm not against GPL, but for now repo is private. It's something li=
ke nvidia's
>>> private downstream kernel that I'm working on. Surely it will becom=
e public but
>>> bit later.
>>>
>>>> OK, so if I accept the private repo link, download the source, and
>>>> repost it on my github account, you're fine with that? If not, the=
n
>>>> you're requesting something semantically equivalent to an NDA.
>>>
>>> For me it's not very important, but my companion may be unhappy wit=
h that. I
>>> just believe that you are not so evil. As I understand NDA should b=
e some
>>> legally valid official document. I'm sure you are much better in th=
is than me,
>>> so let's stop discussing it.
>>>
>>>> However, I'd ask that we resolve the distribution issues of the so=
urce
>>>> kernel first to avoid any tainting of the patch.
>>>
>>> I don't see any issues. It's my personal work that I'm contributing=
 to the
>>> kernel community. If nvidia is against of any public contributions =
just tell me.
>>
>> NVIDIA and indeed the kernel community welcome public contributions.
>>
>> However, the rules in SubmittingPatches (as set by the kernel commun=
ity,
>> not NVIDIA) are clear re: the licensing requirements for patches. If
>> you're taking the patches from a downstream kernel that's published =
as
>> binaries and not source, I believe that makes the patches non-compli=
ant
>> (since there's a GPL violation in the downstream kernel, so the patc=
hes
>> can't be passed off as being GPL compliant), and hence your
>> signed-off-by line is not valid.
>>
>> Once the downstream kernel's source is publicly available, I imagine
>> there will be no problem accepting patches that are derived from it.
>>
>=20
> Hello, Stephen. I made my recent work on kernel public and it's avail=
able
> at https://bitbucket.org/digetx/picasso-kernel/ It contains all patch=
es that
> I have sent and has some small fixes that I will send later. Hope the=
re is no
> problem anymore and you would like to continue reviewing my patches.

Sure. So long as you've read Documentation/SubmittingPatches, and fully
understood exactly what Signed-off-by means and the GPL, I have no
problem taking patches.

It's been a while, so I'd suggest reposting any patches.
