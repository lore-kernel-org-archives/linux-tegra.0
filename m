From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] ARM: multi_v7: copy most options from tegra_defconfig
Date: Thu, 23 Jan 2014 16:20:30 -0800
Message-ID: <CAOesGMjwDg0TzhEGi-sZhtngXPbg=5u54ew6USpq3P7J9QQWjg@mail.gmail.com>
References: <1387569848-16563-1-git-send-email-swarren@wwwdotorg.org>
	<CAOesGMh4PkdTh8EP1WS9-_5cVe1NWuNQPbkskk7hJhtbBEPWBg@mail.gmail.com>
	<52B4A7E9.9090900@wwwdotorg.org>
	<20131222200549.GA11575@quad.lixom.net>
	<CAOesGMj-nvMZhoX4fCe-mf0pBS27=EsS0o2bX7MgmZzjWhYVzQ@mail.gmail.com>
	<52E1B0EE.6080808@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52E1B0EE.6080808-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 23, 2014 at 4:16 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 12/23/2013 10:37 AM, Olof Johansson wrote:
>> On Sun, Dec 22, 2013 at 12:05 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
>>> On Fri, Dec 20, 2013 at 01:26:17PM -0700, Stephen Warren wrote:
>>>> On 12/20/2013 01:16 PM, Olof Johansson wrote:
>>>>> On Fri, Dec 20, 2013 at 12:04 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>>>>> multi_v7_defconfig was missing a large number of options that were in
>>>>> tegra_defconfig. This patch adds them. The changes fall into the
>>>>> following categories:
> ...
>>> Ok, fair enough. Applied.
>>
>> Actually, this one ended up getting messy. We've had
>> multi_v7_defconfig updates in several branches so this doesn't apply
>> cleanly anywhere.
>>
>> I'll apply it on top of for-next where the various branches are
>> merged. It means we'll have to merge it late. Not a big deal, but
>> please help me remember it in case it for some reason gets lost in the
>> shuffle.
>
> I guess this is the correct time to remind you about this? That said,
> the patch is in linux-next, so perhaps that counts as not having been
> lost:-)
