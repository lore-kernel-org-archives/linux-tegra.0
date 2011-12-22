From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] i2c: tegra: Add delay before reset the controller
Date: Thu, 22 Dec 2011 13:17:46 -0800
Message-ID: <CAOesGMire-13yiA9gVQYFWdTa6ZLJLbTW8qoRoPMRQ1ExavVUQ@mail.gmail.com>
References: <1324550480-26308-1-git-send-email-alokc@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1324550480-26308-1-git-send-email-alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dgreid-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

(Adding linux-tegra and Dylan Reid who was debugging this before)

On Thu, Dec 22, 2011 at 2:41 AM, Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> From: Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> In NACK error condition, I2C controller violates
> clock-to-data setup time before stop. In Software,
> because of this reset of controller is happening
> before I2C controller could complete STOP condition.
>
> Added worst case delay of 1 ms (assuming lowest
> clock frequency will be 1 KHZ) before reset the
> controller in case of NACK error.

This change causes problems systems with some models of i2c TPMs, since
the first transaction to them will always time out (TPM quirk), and the delay
means that the tpm will have time to go back to sleep and thus timeout
even on the retry. So you'll never make progress.

In other words: this patch will break some systems and thus shouldn't be
applied.


-Olof
