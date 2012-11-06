From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V3] pinctrl: tegra: add suspend/resume support
Date: Tue, 06 Nov 2012 14:45:29 -0700
Message-ID: <509984F9.1060508@wwwdotorg.org>
References: <5097F013.8070002@wwwdotorg.org> <1352165844-4837-1-git-send-email-digetx@gmail.com> <50988701.5080602@wwwdotorg.org> <50990BE0.9040507@gmail.com> <50994AFB.8000802@wwwdotorg.org> <50996DCC.8030508@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50996DCC.8030508-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/06/2012 01:06 PM, Dmitry Osipenko wrote:
> 06.11.2012 21:38, Stephen Warren wrote:
>> OK, so only you and he have the binaries built from this repository? Or,
>> are those binaries distributed to other people too? If the binaries are
>> distributed, you need to distribute (or offer to make available) the
>> source too. See the GPL for exact requirements.
> 
> I'm not against GPL, but for now repo is private. It's something like nvidia's
> private downstream kernel that I'm working on. Surely it will become public but
> bit later.
> 
>> OK, so if I accept the private repo link, download the source, and
>> repost it on my github account, you're fine with that? If not, then
>> you're requesting something semantically equivalent to an NDA.
> 
> For me it's not very important, but my companion may be unhappy with that. I
> just believe that you are not so evil. As I understand NDA should be some
> legally valid official document. I'm sure you are much better in this than me,
> so let's stop discussing it.
> 
>> However, I'd ask that we resolve the distribution issues of the source
>> kernel first to avoid any tainting of the patch.
> 
> I don't see any issues. It's my personal work that I'm contributing to the
> kernel community. If nvidia is against of any public contributions just tell me.

NVIDIA and indeed the kernel community welcome public contributions.

However, the rules in SubmittingPatches (as set by the kernel community,
not NVIDIA) are clear re: the licensing requirements for patches. If
you're taking the patches from a downstream kernel that's published as
binaries and not source, I believe that makes the patches non-compliant
(since there's a GPL violation in the downstream kernel, so the patches
can't be passed off as being GPL compliant), and hence your
signed-off-by line is not valid.

Once the downstream kernel's source is publicly available, I imagine
there will be no problem accepting patches that are derived from it.
