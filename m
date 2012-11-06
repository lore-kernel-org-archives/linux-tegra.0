From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3] pinctrl: tegra: add suspend/resume support
Date: Wed, 07 Nov 2012 00:06:36 +0400
Message-ID: <50996DCC.8030508@gmail.com>
References: <5097F013.8070002@wwwdotorg.org> <1352165844-4837-1-git-send-email-digetx@gmail.com> <50988701.5080602@wwwdotorg.org> <50990BE0.9040507@gmail.com> <50994AFB.8000802@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50994AFB.8000802-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Message-Id: <50996dd1.c211700a.6058.ffffa722-ATjtLOhZ0NVl57MIdRCFDg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

06.11.2012 21:38, Stephen Warren wrote:
> OK, so only you and he have the binaries built from this repository? Or,
> are those binaries distributed to other people too? If the binaries are
> distributed, you need to distribute (or offer to make available) the
> source too. See the GPL for exact requirements.

I'm not against GPL, but for now repo is private. It's something like nvidia's
private downstream kernel that I'm working on. Surely it will become public but
bit later.

> OK, so if I accept the private repo link, download the source, and
> repost it on my github account, you're fine with that? If not, then
> you're requesting something semantically equivalent to an NDA.

For me it's not very important, but my companion may be unhappy with that. I
just believe that you are not so evil. As I understand NDA should be some
legally valid official document. I'm sure you are much better in this than me,
so let's stop discussing it.

> However, I'd ask that we resolve the distribution issues of the source
> kernel first to avoid any tainting of the patch.

I don't see any issues. It's my personal work that I'm contributing to the
kernel community. If nvidia is against of any public contributions just tell me.

If issue is resolved, then it will be interesting to see your comment to V3 patch.

> You should certainly repost the patch to the people that
> scripts/get_maintainers.pl recommends; the pinctrl subsystem maintainer
> would be the person applying this patch rather than me as the Tegra
> maintainer. Include the ack(s) you've received when you repost.

Thank you for answering.
