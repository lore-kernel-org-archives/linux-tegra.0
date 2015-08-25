From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] PCI: tegra: use __pgprot() around static pgprot_t initializer
Date: Tue, 25 Aug 2015 09:56:16 -0600
Message-ID: <55DC9020.2090300@wwwdotorg.org>
References: <1435681818-14155-1-git-send-email-ard.biesheuvel@linaro.org> <CAKv+Gu82vaxgjkURo_0-Ho6i8pDXM0EuPRxRZobkf4re+DFgKQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKv+Gu82vaxgjkURo_0-Ho6i8pDXM0EuPRxRZobkf4re+DFgKQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/25/2015 09:05 AM, Ard Biesheuvel wrote:
> On 30 June 2015 at 18:30, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> In order to comply with the rules that apply when STRICT_MM_TYPECHECKS
>> is defined, wrap the initializer for a pgprot_t in __pgprot().
...
>
> Ping?

You forgot to send this to the PCI maintainer or mailing list, so I 
imagine they never received it.
