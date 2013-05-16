From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Naming convention DSI + device tree
Date: Thu, 16 May 2013 12:17:37 -0600
Message-ID: <519522C1.5010107@wwwdotorg.org>
References: <20130514181745.GA2762@mail.o2s.ch> <51940C22.4050802@wwwdotorg.org> <20130516071537.GA13573@mail.o2s.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130516071537.GA13573-cEukqlNQfh4fv37vnLkPlQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Lanzend=F6rfer?= <david.lanzendoerfer-Z7Kmv9EsliU@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/16/2013 01:15 AM, David Lanzend=F6rfer wrote:
> On Wed, May 15, 2013 at 04:28:50PM -0600, Stephen Warren wrote:
>> On 05/14/2013 12:17 PM, David Lanzend=F6rfer wrote:
>>> Hello I have the following issue: In order to make the DSI
>>> controller react at all,
>>=20
>> Hmm. In the upstream kernel, we don't even have a DSI driver at
>> all for Tegra, so control over the panel itself is likely the
>> least of your worries for now.
>=20
> Is there a patch set pending for merge into upstream which will
> provide this support? And if yes, where can I find these pending
> patches? I'd like to build up my code based on already existing
> work which is expected to be in upstream at some later point of
> time.

No, we haven't yet posted DSI support upstream.

>>> I need to pass him a certain combination of pin states. Until
>>> now within the code of the original android kernel which was
>>> using board files this has just been done by doing bit
>>> banging.
>>>=20
>>> namely: gpio_set_value(tf201_lvds_shutdown, 1); ... Now with a
>>> device tree comes the question: Where should I put this?
>>=20
>> Likely, you will need to create a DT binding that represents the=20
>> particular panel model that you have, and make the Tegra display=20
>> controller node refer to that panel node. The panel node would
>> need properties to describe the various GPIOs used to control the
>> panel. Then, you'd want to write a panel-specific driver that
>> handles that device tree node.
>=20
> That was my thought too. Where should I put this panel-specific
> driver?

Honestly, I'm not sure. I assume (and it is just an assumption) that
if you look at the CDF patches, you should find some examples of panel
drivers that use it, although perhaps there aren't any yet...

>> All of this will likely need to be integrated with the upcoming
>> Common Display Framework.
>=20
> Is this upcoming CDF included within your "linux-next_common"
> branch?

No. That branch of mine is basd on linux-next, so whatever is in
linux-next is in my branch, and I certainly haven't applied the CDF
locally.

I believe the CDF has been posted to various mailing lists a few
times, but it isn't checked in yet since there isn't a final version.
I CC'd Alex; he might know the status better than me.
