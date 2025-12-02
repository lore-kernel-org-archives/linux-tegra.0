Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8598013A3F7
	for <linux-tegra@vger.kernel.org>; Tue,  2 Dec 2025 14:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764684858; cv=none; b=FT1nQoelZjXN7Uf/K1AbZhXVRq+Ex6PWv16b9b4v/xkAXcEmfNtJVf2NbqIxMoxpJJOA/gWxitamRYJre40SXXUyOn5IDN90SQkB8DX+w731RFiGfSRl3iO9bSZHwHxHnTrNdtZu/Kn3cyzpvWbd7I3xv/P0GBWEad996fMg2xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764684858; c=relaxed/simple;
	bh=vHUrQ6w324fYnCNxiHl4mdFInNGEkkrZLMojf3dBXGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q7F26g68EU7FmiaAuhHPIwyqCs3XnxatPz66RRZt4Wf9iYPkVZ3Au43YC9RVC8+asraZBf8iwAwNO/TipV18P3ASTaehXdD0/WJ8qKqWjSLSgLAbwX3uY+dJXVrX4Xkg46BL1Qgnq3RifYl0UIFS/XCVRZtzoLM5yPT5ElUXBqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-65745a436f7so2382145eaf.3
        for <linux-tegra@vger.kernel.org>; Tue, 02 Dec 2025 06:14:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764684855; x=1765289655;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P35uIC8+DPfTCMfHgmdtX7Glr2h/6n9nJWKZMAhyHf0=;
        b=S8KdEQ76xMRjYe8qZfZTDwftopZwQNisZoO68zobH0nwmNYdxzY1WA/IBMT7Pkj0z7
         Q/Yo/dK8Kruss67mwTTBPz3V14RqtocTkNwk4BNTpJ3NcM9yYK0bdVi+s5CMbB6YyzmT
         lpYdr7PPtLO2chQMhApeqZYaqztJv1L0JZrdaOX3PA902B+G9MvBOo7POkexeVKl0DUc
         pSSYpPiShcr/wEGBmElhFwgn7pbYUWsVKvNh/SbuPizZmggKmJVJM3mb0BX70J7MyJnN
         seL6/VehqYbmKzXyC4KM0MFjY4jlkSryH7k8+KgUtzbfOFCvS9+YBB+/VaBpVYgEM9Fb
         Emgg==
X-Forwarded-Encrypted: i=1; AJvYcCWVk9YECZJ3ixo6y6ifI+YjdOg1KBxjW9hawnCKYkPODg5QlU/olJTA/4dCtU27z+8ymnn+ndZHNAcWOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsXVqMFQYc0HGOITrD13L7ejdtwa9Rdu82IOtWKY80Di2D3iiD
	bHSEu9g/fR2DbqHHCXK+mM8v1wiQX9Jp6XXVoeluvzA75MB1Xp3PsHspChdEdwEU
X-Gm-Gg: ASbGnct1IJDYg4kCRFjkKPPQSEL4rQf8yuzG9kIp1SDJOaIvY2rba8ktYZOG2bBiMrS
	JxHTX/Ot5wwbU8t/ncfqAseqccoyKwq/Y9pe9WsL92K2jUkJyR6HTIhzZDTHcqzk7XdwUv4Yf/m
	ALZHHKghG9gjTd39XgFpOYMXifn2k/4vZjx3av0wtHuUrcOa+0+s8lu9NeZhX3aD6LgulT73Wwn
	FaZ8X95VdO0tOUIpo1vhavCfLsZN+SKps20hv83qjTYU+5cr4jrpRPiSqzE0K3uNng9BeNS6zmv
	SbVlsA3MDZeGJStD/x+amJYRM7oi2jaY3ALNAE1GlxS0Q1LNrBk4Tiyf6VPg2kIEV3BYp9ZkfDA
	D+dBPZyHH15l3fqvJsXemOORPkeoAX5/ze+iX02xzZO/qJOGTo40NOw9dK92L1a7O+vUSpSDPPE
	gkol/b+VlHoM8rN9tivlrwdBD+/A9voZ8QVVZIPzpbkmaUmXg3
X-Google-Smtp-Source: AGHT+IH8VCnc3yCHhzd663qe675Bq6Rv9yxPCgBHeODH+r4KTBanjGXQKpcbMAETWt/Bq16e50JiWg==
X-Received: by 2002:a05:6820:60b:b0:657:7214:b534 with SMTP id 006d021491bc7-65790b48f43mr19756962eaf.6.1764684855287;
        Tue, 02 Dec 2025 06:14:15 -0800 (PST)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com. [209.85.160.54])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-659332cf153sm4097716eaf.1.2025.12.02.06.14.15
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 06:14:15 -0800 (PST)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-3f0cbfae787so862030fac.3
        for <linux-tegra@vger.kernel.org>; Tue, 02 Dec 2025 06:14:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX3KBc+yFEYLxUN6bfuYmLXh8LNtBOGLBVOc0yK2bSZlnPwIZ8orbEIs6g3G4Ot3FNsWO4AoQ5jBtSOPA==@vger.kernel.org
X-Received: by 2002:a53:dd48:0:b0:63e:17d8:d977 with SMTP id
 956f58d0204a3-64302abbb9cmr22209916d50.41.1764684434875; Tue, 02 Dec 2025
 06:07:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org> <20251112-b4-of-match-matchine-data-v2-1-d46b72003fd6@linaro.org>
In-Reply-To: <20251112-b4-of-match-matchine-data-v2-1-d46b72003fd6@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Dec 2025 15:07:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVAZpp7M+pp27+kHZwoet2Q8Rm-Y4ePu7=W_1oXhebLmQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnQtK_C28o8ts-DX6QMHSfgR5FWBqGmuyp3cjxdu41cx4XkoPs5W_lQhYE
Message-ID: <CAMuHMdVAZpp7M+pp27+kHZwoet2Q8Rm-Y4ePu7=W_1oXhebLmQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] of: Add wrappers to match root node with OF
 device ID tables
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for your patch, which is now commit 4a93adcbd201aad5
("of: Add wrappers to match root node with OF device ID tables")
in dt-rh/for-next.

On Wed, 12 Nov 2025 at 11:30, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Several drivers duplicate same code for getting reference to the root
> node, matching it against 'struct of_device_id' table and getting out
> the match data from the table entry.
>
> There is a of_machine_compatible_match() wrapper but it takes array of
> strings, which is not suitable for many drivers since they want the
> driver data associated with each compatible.
>
> Add two wrappers, similar to existing of_device_get_match_data():
> 1. of_machine_device_match() doing only matching against 'struct
>    of_device_id' and returning bool.
> 2. of_machine_get_match_data() doing the matching and returning
>    associated driver data for found compatible.

Shouldn't the first function be called of_match_machine(), and return
a const struct of_device_id *, cfr. of_match_device()?

>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -434,6 +434,53 @@ bool of_machine_compatible_match(const char *const *compats)
>  }
>  EXPORT_SYMBOL(of_machine_compatible_match);
>
> +/**
> + * of_machine_device_match - Test root of device tree against a of_device_id array
> + * @matches:   NULL terminated array of of_device_id match structures to search in
> + *
> + * Returns true if the root node has any of the given compatible values in its
> + * compatible property.
> + */
> +bool of_machine_device_match(const struct of_device_id *matches)
> +{
> +       struct device_node *root;
> +       const struct of_device_id *match = NULL;
> +
> +       root = of_find_node_by_path("/");
> +       if (root) {
> +               match = of_match_node(matches, root);
> +               of_node_put(root);
> +       }
> +
> +       return match != NULL;
> +}
> +EXPORT_SYMBOL(of_machine_device_match);
> +
> +/**
> + * of_machine_get_match_data - Tell if root of device tree has a matching of_match structure
> + * @matches:   NULL terminated array of of_device_id match structures to search in
> + *
> + * Returns data associated with matched entry or NULL
> + */
> +const void *of_machine_get_match_data(const struct of_device_id *matches)
> +{
> +       const struct of_device_id *match;
> +       struct device_node *root;
> +
> +       root = of_find_node_by_path("/");
> +       if (!root)
> +               return NULL;
> +
> +       match = of_match_node(matches, root);
> +       of_node_put(root);
> +
> +       if (!match)
> +               return NULL;
> +
> +       return match->data;
> +}
> +EXPORT_SYMBOL(of_machine_get_match_data);

These two functions are very similar, but look different.  If the
former would return a pointer instead of a bool, the latter could be
built on top.

Even if you still prefer returning a bool, they could share a common
private helper returning a pointer.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
