From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] regulator: palmas: add input supply names
Date: Wed, 20 Mar 2013 10:07:17 -0600
Message-ID: <5149DEB5.7000709@wwwdotorg.org>
References: <1363598989-25112-1-git-send-email-ldewangan@nvidia.com> <20130320123128.GM28775@opensource.wolfsonmicro.com> <5149B19E.90400@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5149B19E.90400-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/20/2013 06:54 AM, Laxman Dewangan wrote:
> On Wednesday 20 March 2013 06:01 PM, Mark Brown wrote:
>> * PGP Signed by an unknown key
>>
>> On Mon, Mar 18, 2013 at 02:59:48PM +0530, Laxman Dewangan wrote:
>>
>> There's something odd about several recent patch serieses you've posted,
>> they end up with patch 2 before instead of after patch 1.  Anyway...
> 
> I generally send a patches on single git-send command
> git send-emal --to=ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org 0000.patch 0001.patch

Don't do that; send *.patch. If you don't, then patches 2..n don't end
up being "in-reply-to" patch 1, so they won't show up as a single email
thread.
