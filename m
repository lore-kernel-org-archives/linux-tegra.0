From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2] ARM: dt: tegra: paz00: add regulators
Date: Wed, 27 Jun 2012 11:08:14 -0600
Message-ID: <4FEB3DFE.7030203@wwwdotorg.org>
References: <1340757060-27232-1-git-send-email-swarren@wwwdotorg.org> <20120627113100.GF308@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120627113100.GF308-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/27/2012 05:31 AM, Mark Brown wrote:
> On Tue, Jun 26, 2012 at 06:31:00PM -0600, Stephen Warren wrote:
> 
>> sm1: HW defaults and schematic match at 1.0v. marvin24's kernel had a max
>> of 1.125v, but this wasn't applied since apply_uV wasn't set.
> 
> apply_uV is only valid if a single voltage is specified.  If a voltage
> range were specified and it were acted on we'd take the lowest (not
> highest) voltage allowed.

Ah right. When I apply this, I'll reword that to something more like:

sm1: HW defaults and schematic match at 1.0v. marvin24's kernel had a
max of 1.125v, but this higher voltage was only applied to HW by DVFS
code, which isn't currently supported in mainline.
