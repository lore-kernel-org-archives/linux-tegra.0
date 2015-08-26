From: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] PCI: tegra: use __pgprot() around static pgprot_t initializer
Date: Wed, 26 Aug 2015 10:50:55 +0200
Message-ID: <CAKv+Gu_jDvaTypEFjgQO03S-sEaEsbmPXL-38Mkd4RuozjykJA@mail.gmail.com>
References: <1435681818-14155-1-git-send-email-ard.biesheuvel@linaro.org>
	<CAKv+Gu82vaxgjkURo_0-Ho6i8pDXM0EuPRxRZobkf4re+DFgKQ@mail.gmail.com>
	<55DC9020.2090300@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55DC9020.2090300-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 25 August 2015 at 17:56, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 08/25/2015 09:05 AM, Ard Biesheuvel wrote:
>>
>> On 30 June 2015 at 18:30, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> wrote:
>>>
>>> In order to comply with the rules that apply when STRICT_MM_TYPECHECKS
>>> is defined, wrap the initializer for a pgprot_t in __pgprot().
>
> ...
>>
>>
>> Ping?
>
>
> You forgot to send this to the PCI maintainer or mailing list, so I imagine
> they never received it.

Oops, my bad. Resent it just now

Thanks,
Ard.
