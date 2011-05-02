From: Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: tegra: irq: convert to gic arch extensions
Date: Mon, 02 May 2011 07:37:35 +0200
Message-ID: <20110502053735.68CF01537B0@gemini.denx.de>
References: <1304284213-11950-1-git-send-email-ccross@android.com> <1304284213-11950-2-git-send-email-ccross@android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1304284213-11950-2-git-send-email-ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: lakml <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Dear Colin Cross,

In message <1304284213-11950-2-git-send-email-ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org> you wrote:
> Replace the ugly hack that inserts legacy irq controller calls
> into the irq call paths by reading and replacing the gic irq
> chip with the new gic arch extensions.
...
> - * Copyright (C) 2010 Google, Inc.
> + * Copyright (C) 2011 Google, Inc.

Sorry for nitpicking, but should this not be "(C) 2010-2011" instead?
You don't want to revoke the 2010 rights on the code, do you?

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd-ynQEQJNshbs@public.gmane.org
It usually takes more than three weeks to prepare  a  good  impromptu
speech.                                                  - Mark Twain
