Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1805028A709;
	Wed,  4 Jun 2025 09:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749029131; cv=none; b=nyYB0QG6ctQj1acN6yomtMmS9HGV9oeruHBYebIAHaqjuK/hyJjEU8pMO8E6RwPwvUZtqU64JsVMkylsmAYCmVpeI/fTzwRL1QZoB14t0zTGg4ePJtc+EjP+ubUvPgCz1Bk+2LUX0c7OhlaChsu/TKt98539846Liv33BKKBmkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749029131; c=relaxed/simple;
	bh=pDHZIjK7WAovtriLfhkg5I5s02XXada9zCuzEphg9WE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Wxr8RTWvIEWMbLuQ0RbEh8fPm582AGEj4jveH+rc5vI1437/GFVQW6cZCMk7Per9eFSvo/bITfGfHyneNcJKvUQoBSFSk8pANOFt5otQGvIS/DWWWxnUHiYm68SLHix7RMbkaSl3HVKAY1JgDkM7LKmXl37D4Ok3tcrZFJNLJco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lv6FqFP8; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=c1OQwLBv; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lv6FqFP8";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="c1OQwLBv"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749029128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CBMX+Dz0hWZn3u61TkOzdRuiBkDqYb9ZBGePVYRUeEQ=;
	b=lv6FqFP85RWJPgGMKGEGoJ8fiGRsIIzMsw+C7cOmFYjjXtG04m4TEDQemXvE7cgRqsFXPd
	z9JmC21/h22ICKLDGvKbWODuvaDqs1n9z/wmi0MKitLwCrTJfTEK8Cw43K8HfBBSIqx9wh
	tdgflehM7qIrUvaSaUCiYk+xjd3buIE1rmUwM7VxmhxRXxwzqU1W7LouUzJ8HtQnbPt4Fk
	/ZR0KEJSqjZr+rcPyt2msUa9iKw4Ekmr+/WyajSXe4MayGDWAODKZuGRTaCBAPcxKsWR8r
	ebYighvkz1eHgXHDMZJFMMFF2aKbIigPm42zRd/JYfSUq5yvKHeQArPiweohMw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749029128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CBMX+Dz0hWZn3u61TkOzdRuiBkDqYb9ZBGePVYRUeEQ=;
	b=c1OQwLBvCBk634Hl0YCxp3U/Cu3qvpqjvtecbJXF8ha8hIIihbmfAWiMhx8D+fuTdnN108
	EqoL8TGlJRCOImBw==
To: Daniel Lezcano <daniel.lezcano@linaro.org>, daniel.lezcano@linaro.org
Cc: Jim Cromie <jim.cromie@gmail.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Marco Elver <elver@google.com>, Nam Cao <namcao@linutronix.de>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, John Stulz <jstultz@google.com>, Will
 McVicker <willmcvicker@google.com>, Peter Griffin
 <peter.griffin@linaro.org>, Saravan Kanna <saravanak@google.com>
Subject: Re: [PATCH v1 7/7] time: Export symbol for sched_clock register
 function
In-Reply-To: <20250602151853.1942521-8-daniel.lezcano@linaro.org>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
 <20250602151853.1942521-8-daniel.lezcano@linaro.org>
Date: Wed, 04 Jun 2025 11:25:27 +0200
Message-ID: <87wm9rq2ns.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Jun 02 2025 at 17:18, Daniel Lezcano wrote:

$Subject:  s@time:@time/sched_clock:@

please

Other than that:

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
