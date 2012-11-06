From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V3] pinctrl: tegra: add suspend/resume support
Date: Tue, 06 Nov 2012 10:38:03 -0700
Message-ID: <50994AFB.8000802@wwwdotorg.org>
References: <5097F013.8070002@wwwdotorg.org> <1352165844-4837-1-git-send-email-digetx@gmail.com> <50988701.5080602@wwwdotorg.org> <50990BE0.9040507@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50990BE0.9040507-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/06/2012 06:08 AM, Dmitry Osipenko wrote:
>> 06.11.2012 07:41, Stephen Warren wrote:
>> Oh, it's not public? I've been asked not to sign any NDAs/agreements/...
>> without review from NVIDIA legal, and a non-public git repo seems like
>> it'd fall into the same category. I'm left wondering how the repo is
>> useful if it isn't public.
> 
> I think you are wrong. It's personal private repo. I and my companion are
> working on it for our android rom in our spare time, it's just a hobby. The
> reason we are keeping it private is that there are some "devs" (on

OK, so only you and he have the binaries built from this repository? Or,
are those binaries distributed to other people too? If the binaries are
distributed, you need to distribute (or offer to make available) the
source too. See the GPL for exact requirements.

> xda-developers especially) that will copy-paste all your work

That's kindof the whole point of the license...

> with all original author info wiped. We think it's a bit unfair,

Ok, that's certainly not right. However, I don't believe it affects your
obligations under the GPL.

(Of course, I Am Not A Lawyer, and in fact I complete hate SW licensing
issues; I'd far rather be able for everyone to publish everything as
public domain or something equivalently simple, yet still have everyone
else behave nicely and contribute their changes back. Still, that's
evidently a naive desire).

> There are no nda's, no agreements and should be 100% safe for you. All those
> nda's just makes people unhappy...

OK, so if I accept the private repo link, download the source, and
repost it on my github account, you're fine with that? If not, then
you're requesting something semantically equivalent to an NDA.

> I never contributed to mainline kernel before and want to ask what should I do
> when my patches are reviewed/acked? Should I resend patch with reviewed/acked
> line or something else?

You should certainly repost the patch to the people that
scripts/get_maintainers.pl recommends; the pinctrl subsystem maintainer
would be the person applying this patch rather than me as the Tegra
maintainer. Include the ack(s) you've received when you repost.

However, I'd ask that we resolve the distribution issues of the source
kernel first to avoid any tainting of the patch.
