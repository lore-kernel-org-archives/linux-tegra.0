From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCHv2 4/4] ARM: tegra: irq: Add tegra_eoi
Date: Wed, 04 May 2011 18:01:42 +0100
Message-ID: <1304528502.1935.2.camel@craptop>
References: <1304284213-11950-5-git-send-email-ccross@android.com>
	 <1304288854-11011-1-git-send-email-ccross@android.com>
	 <1304414973.27863.2.camel@e102144-lin.cambridge.arm.com>
	 <BANLkTi=a26_A7yAAfkQd5NSxbR+reQCZ1g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BANLkTi=a26_A7yAAfkQd5NSxbR+reQCZ1g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: lakml <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marc Zyngier <Marc.Zyngier-5wv7dgnIgG8@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, 2011-05-03 at 19:41 +0100, Colin Cross wrote:
> What is your plan for merging the fasteoi patches?  If you are
> planning to put them in 2.6.40, can you pull these patches into your
> tree?  I don't have any other Tegra changes planned for 2.6.40, so
> they shouldn't cause conflicts later.

Ok, since Santosh would like me to take his relaxed I/O stuff for the
GIC too then I guess I can put all of this into an irq branch along with
the fasteoi changes.

Russell - would you be happy pulling this from me if I put it together?

Cheers,

Will
