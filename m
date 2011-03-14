From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: Move tegra in linux-next merge order
Date: Mon, 14 Mar 2011 15:51:40 -0700
Message-ID: <AANLkTim1C3gHgp_OoJTTR_Vjx6nK-RKtQZXvhVWvEj=h@mail.gmail.com>
References: <AANLkTikoBGKh9DP1q3ujDBg1fH5Azkahy8RpSO=GqzOR@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTikoBGKh9DP1q3ujDBg1fH5Azkahy8RpSO=GqzOR-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Linux Tegra Mailing List <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Ben Dooks (embedded platforms)" <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Mar 14, 2011 at 1:37 PM, Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wrote:
> I am going to push changes to tegra's for-next branch that will only
> build after the asoc branch is merged, and will include a merge of a
> small part of Ben's next-i2c branch. =A0Can you move tegra after thes=
e
> branches?
>
> Should I merge the asoc branch in below the patches that depend on it
> in tegra's for-next tree, or should I push a branch that will not
> build without merging into linux-next?

My $.02:

If you want to push a branch that's not for-next that contains the
dependencies to make it easier for people to test, that might be a
good option.

=46or linux-next, if the branch is pulled by sfr after the asoc and i2c
trees, the option with least hassle is to just leave it out of your
branch (my board branch left them out, I just merged that branch into
linux-next to test it).


-Olof
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
